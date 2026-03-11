pipeline {
    agent any

    environment {
        IMAGE_NAME = "nihitana29/ubuntu-webserver"
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKERHUB_CREDENTIALS = "dockerhub-credentials" [cite: 2]
    }

    stages {
        stage('Pull base image') {
            steps {
                script {
                    // Utilise la méthode native pour éviter l'erreur "command not found" 
                    docker.image('ubuntu:24.04').pull() [cite: 3]
                }
            }
        }

        stage('Build image') {
            steps {
                script {
                    // Construction de l'image en utilisant le contexte local [cite: 4]
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}") [cite: 4]
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Gestion sécurisée des identifiants DockerHub [cite: 5, 6]
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push() [cite: 5, 7]
                    }
                }
            }
        }
    }
}
