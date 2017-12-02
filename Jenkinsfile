pipeline{
	agent none
	stages{

		stage('Example'){
			agent {
				docker{
					image 'alpine'

				}
			}
			steps{
				echo 'hello world'
			}
		}
	}
}