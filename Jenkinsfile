pipeline {
    agent {
        docker { 
        	image 'node:7-alpine'
         	args '-v $HOME/.m2:/root/.m2'
         }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}