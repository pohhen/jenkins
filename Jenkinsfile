#!groovy

// Basic Jenkinsfile example - just building the Dockerfile of Jenkins

node {
    timestamps {
        timeout(20) {  // Timeout build after 20 minuts, don't leave me hanging!
            stage('Git checkout') {
                checkout scm
            }
            stage('Docker build') {
                sh 'docker build .'
            }
        }
    }
}
