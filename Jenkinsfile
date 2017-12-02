pipeline{
	agent{
		docker{
			image 'nickcandy/cartap'
			args  '-p 8888:8080'
		}
	}
	stages{
		stage('Example'){
			steps{
				echo 'hello world'
			}
		}
	}
}