pipeline {
    agent none
    stages {

        stage('Example') {
 	        agent {docker 'alpine:latest'}
            steps { 
                echo 'Hello World'
            }
        }
    }
}