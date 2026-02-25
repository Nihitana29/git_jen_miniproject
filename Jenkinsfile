pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nom_docker/image:tag" // Remplace par ton DockerHub username et nom d'image
        DOCKERHUB_CREDENTIALS = "dockerhub-id" // ID du credential Jenkins pour DockerHub
    }

    stages {

        stage('pull') {
            steps {
                echo "Pulling ubuntu:24.04 from DockerHub..."
                sh "docker pull ubuntu:24.04"
            }
        }

        stage('build') {
            steps {
                echo "Building Docker image ${DOCKER_IMAGE}..."
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('push') {
            steps {
                echo "Pushing Docker image to DockerHub..."
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

    }
}
