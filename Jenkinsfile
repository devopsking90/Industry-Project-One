node {
	agent { label 'agent1' }
	def application = "springbootapp"
	def dockerhubaccountid = "plamsal90"

	stage('Clone repository') {
		checkout scm
	}
		stage('Build image') {
		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
		stage('Push image') {
		withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
		app.push()
		app.push("latest")
	}
			
		}
	stage('Deploy') {
		sh ("docker run -d -p 81:8080 ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
		
	}
}
