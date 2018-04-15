#!groovy

// Basic Jenkinsfile example - just building the Dockerfile of Jenkins

node {
    stage('Git checkout') {
        checkout scm
    }
    stage('Docker build') {
        sh 'docker build .'
    }
}
