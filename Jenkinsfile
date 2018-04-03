#!groovy

// Basic Jenkinsfile example - just building the Dockerfile of Jenkins

node {
    stage('Git checkout') {
        git url: 'https://github.com/pohhen/jenkins.git'
    }
    stage('Docker build') {
        docker build .
    }
}