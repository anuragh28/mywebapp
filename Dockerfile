pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker_hub_credentials_id' // Your Docker Hub credentials ID
        DOCKER_IMAGE_NAME = 'anurag3028/ise_3' // Docker image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/anuragh28/mywebapp.git',
                   
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the specified name
                    def app = docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        def app = docker.image(DOCKER_IMAGE_NAME)
                        app.push() // Pushes the image to Docker Hub
                    }
                }
            }
        }
    }
}
