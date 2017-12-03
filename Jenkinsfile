pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            customWorkspace '/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B'
            }
        }
    }
}