pipeline {
    agent {
    docker {
        image 'maven:3-alpine' 	 
        args '-v /target:/root/.m2'
    }
} 
    stages {
        stage('Example Build') {
            steps {
                sh 'mvn -B clean verify'
            }
        }
    }
} 