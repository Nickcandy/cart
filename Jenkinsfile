
pipeline {
    agent { docker 'alpine' } 
    stages {
        stage('Example Build') {
            steps {
                sh 'mvn -B clean verify'
            }
        }
    }
}