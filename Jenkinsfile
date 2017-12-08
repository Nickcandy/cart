pipeline {
    agent none
    stages {
		stage('Build'){
		    agent {
     		   docker {
            		image 'nickcandy/cartap'
            		args '-v /home/nick/cart:/home/nick -p 8888:8080'
        		}
    		}
			steps{
			sh '''
				mvn -s /home/nick/settings.xml clean package 
				cp target/*.war var/tmp/tomcat/apache-tomcat-8.5.8/webapp
				cd var/tmp/tomcat/apache-tomcat-8.5.8/bin
				./startup.sh
			'''
				stash includes: 'target/*.war', name: 'app'
			}
		}

    }
}
