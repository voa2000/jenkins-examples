node {
	def app

	stage ('Clone repository') {
		checkout scm
	}

	stage ('Build image') {
		app =docker.build('voa2000/jenkins-examples')
	}

	stage('Push image') {
		docker.withRegistry(https://registory.hub.docker.com', 'docker-user') {
			app.push('latest')
		}	
	}

}
