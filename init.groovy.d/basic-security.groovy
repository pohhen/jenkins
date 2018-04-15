#!/usr/bin/env groovy

// Configure basic security
//
// Sets the authorization strategy for Jenkins master
// and creates a default admin user with an initial password

import jenkins.model.*
import hudson.security.*
import org.jenkinsci.main.modules.cli.auth.ssh.UserPropertyImpl
import org.apache.commons.lang.RandomStringUtils

def instance = Jenkins.getInstance()
def env = System.getenv()

// You can give as env parameters in Docker run, e.g.: '-e ENV_USER=jenkins_user' 
def custom_user = env['ENV_USER']
def custom_passwd = env['ENV_PASSWD']
def no_admin = env['DO_NOT_ADMIN']

if (!(instance.getSecurityRealm() instanceof HudsonPrivateSecurityRealm)) {
    instance.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
}

def currentUsers = instance.getSecurityRealm().getAllUsers().collect { it.getId() }
if (('admin' in currentUsers)) {
    println "--> admin exists"
}

if (!("$custom_user" in currentUsers) && (custom_user?.trim()) && (custom_passwd?.trim())) {
    println "\n\nUsername and password given in parameters\n"
    // Create custom user given in env parameter
    println "--> creating $custom_user"
    instance.getSecurityRealm().createAccount("$custom_user", "$custom_passwd")
    println "... Done creating $custom_user!\n\n"
}

if (!('admin' in currentUsers) && !("$no_admin" == 'true')) {
    println "\n--> creating local user 'admin'"
    println "WARNING: Remember to change the admin password!"

    // Generate an initial admin password
    int randomStringLength = 24 // Reasonable length for an initial password
    // Initial password, don't get too wild with the characters
    def charset = (('a'..'z') + ('A'..'Z') + ('0'..'9')).join()
    def initialAdminPass = RandomStringUtils.random(randomStringLength, charset.toCharArray())

    instance.getSecurityRealm().createAccount('admin', initialAdminPass)

    println "\nInitial admin password is:\n\n${initialAdminPass}\n\n"
}

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

instance.save()