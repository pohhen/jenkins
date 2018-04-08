#!groovy

// Basic Jenkinsfile example - just building the Dockerfile of Jenkins

node {
    timestamps {
        timeout(20) {  // Timeout build after 20 minuts, don't leave me hanging!
            stage('Git checkout') {
                git url: 'https://github.com/pohhen/jenkins.git'
            }
            stage('Docker build') {
                sh 'docker build .'
            }
        }
    }
}
