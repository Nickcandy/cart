pipeline{
	agent none
	stages{

		stage('Example'){
			agent {
				docker{
					image 'nickcandy/cartap'
					args  '-it -d'
				}
			}
			steps{
				echo 'hello world'
			}
		}
	}
}