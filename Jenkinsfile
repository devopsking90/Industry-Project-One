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
                    docker.build("plamsal90/abcdef-technology:${TAG}")
                }
            }
        }
	    stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com", "dockerhub") {
                        docker.image("plamsal90/abcdef-technology:${TAG}").push()
                        docker.image("plamsal90/abcdef-technology:${TAG}").push("latest")
                    }
                }
            }
        }
        stage('Deploy'){
            steps {
 
                sh "docker run --name cmon -d -P plamsal90/abcdef-technology:${TAG}"
            }
        }
    }
}
