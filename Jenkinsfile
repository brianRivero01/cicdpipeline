pipeline {
	agent any

	stages {
		stage("Build") {
			steps {
				dir '/site'
				sh 'npm install'
				sh 'npm run build'
			}
		}
		
		 stage('Test') {
            steps {
                dir '/site'
                sh 'npm test'
            }
        }
        
		
		stage('Quality Test') {
            steps {
                dir '/site'
                sh 'npm install standard --save-dev'
            }
        }
       
		stage("DeployProd") {
		    steps {
		        dir '/site'
		        sh './deploy.sh'
		    }
		}
			
		stage("DockerBuilds") {
			steps {
    		    dir '/site'
    		    script{
    		        sh 'docker build -t myjenkins .'
    		    }
			}
		 }
	}
}
