pipeline {
      environment {
        registry = "voa2000/jenkins-image"
        registryCredential = 'DOCKER-HUB-CREDENTIALS'
        dockerImage = ''
      }

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
 }