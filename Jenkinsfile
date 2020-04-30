node {
	def app

	stage ('Clone repository')
	{
		checkout scm
	}

	stage ('Build image')
	{
		app = docker.build('voa2000/jenkins-examples')
	}

	stage('Push image')
	{
		docker.withRegistry('https://registory.hub.docker.com', 'DOCKER-HUB-CREDENTIALS')
		{
			app.push('latest')
		}	
	}

	pipeline {
      environment {
        registry = "gustavoapolinario/docker-test"
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
      agent any
      stages {
        stage('Cloning Git') {
          steps {
            git 'https://github.com/gustavoapolinario/microservices-node-example-todo-frontend.git'
          }
        }
        stage('Building image') {
          steps{
            script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
          }
        }
        stage('Deploy Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
              }
            }
          }
        }
        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }
      }
    }

}
