pipeline {
    agent none
    stages {
    	agent {docker 'alpine:latest'}
        stage('Example') {
            steps { 
                echo 'Hello World'
            }
        }
    }
}