pipeline {
    agent {
    docker {
        image 'maven:3-alpine' 	 
        customWorkspace '/c/Users/liunanx/.jenkins/workspace'
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