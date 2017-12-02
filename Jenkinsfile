pipeline{
	agent none
	stages{

		stage('Example'){
			agent {docker 'nickcandy/cartap'}
			steps{
				echo 'hello world'
			}
		}
	}
}