pipeline {
     agent {
                   docker {
                        image 'nickcandy/cartap'
                        args '-d -v /home/nick/cart:/home/nick -p 8888:8080'
                        }
                }

    stages {
		stage('Build'){
			steps{
			sh '''
				cd /home/nick
				mvn -s /home/nick/settings.xml clean package 
				cp target/*.war /var/tmp/tomcat/apache-tomcat-7.0.82/webapps
			
			'''
				
			}
		}
		stage('Deploy'){
			steps{
				sh '/var/tmp/tomcat/apache-tomcat-7.0.82/bin/startup.sh'
			}
		}
		   stage('check') {
            steps {
                input "?"
            }
        }


    }
}
