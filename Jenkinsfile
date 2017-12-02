pipeline{
	agent{
		docker{
			image 'nickcandy/cartap'
			label 'maven'
			args  '-p 8888:8080'
		}
	}
	stages{
		stage('git'){
			sh '''
				mkdir var/tmp/cart
		 		cd var/tmp/cart
		 		git init
		 		git clone git@github.com:Nickcandy/cart.git
		 	'''

		}
		stage('build'){
			sh '''
				cd var/tmp/cart/cart
				mvn clean package -U
				cp target/*.war var/tmp/tomcat/apache-tomcat-8.5.8/webapp
				cd var/tmp/tomcat/apache-tomcat-8.5.8/bin
				./startup.sh
			'''
				stash includes: 'target/*.war', name: 'app'
		}

		stage('dockerize'){
		
		}
	}
}