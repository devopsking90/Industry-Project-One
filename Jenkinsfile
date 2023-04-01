pipeline {
    agent any
    tools {
        jdk 'myjava'
        maven 'mymaven'

    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("plamsal90/abc-technology-cloud:${TAG}")
                }
            }
        }
	    stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com", "dockerhub") {
                        docker.image("plamsal90/abc-technology-cloud:${TAG}").push()
                        docker.image("plamsal90/abc-technology-cloud:${TAG}").push("latest")
                    }
                }
            }
        }
 	stage("kubernetes deployment"){
	steps {
        	sh 'kubectl apply -f k8s-spring-boot-deployment.yml'
	}
    }

    }
}
