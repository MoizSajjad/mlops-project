pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'moizsajjad/mlops-app'
        CONTAINER_NAME = 'lucid_merkle'
        CONTAINER_PORT = '5000'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    git branch: 'dev', url: 'https://github.com/MoizSajjad/mlops-project.git'
                }
            }
        }

        stage('Verify Files in Workspace') {
            steps {
                bat 'dir'
            }
        }

        stage('Cleanup Docker Container') {
            steps {
                script {
                    echo "Stopping and removing existing container if running..."
                    bat '''
                    docker stop %CONTAINER_NAME% || exit 0
                    docker rm %CONTAINER_NAME% || exit 0
                    docker system prune -f || exit 0
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerFileExists = fileExists 'Dockerfile'
                    if (dockerFileExists) {
                        bat "docker build -t %DOCKER_IMAGE% ."
                    } else {
                        error "ERROR: Dockerfile not found!"
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials']) {
                        bat "docker push %DOCKER_IMAGE%"
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Running new Docker container..."
                    bat '''
                    docker stop %CONTAINER_NAME% || exit 0
                    docker rm %CONTAINER_NAME% || exit 0
                    docker run --rm -d -p %CONTAINER_PORT%:5000 --name %CONTAINER_NAME% %DOCKER_IMAGE%
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
            emailext (
                subject: "✅ Jenkins Deployment Successful!",
                body: "The deployment of MLOps app was successful! Check the deployed app at http://localhost:%CONTAINER_PORT%",
                to: "i212691@nu.edu.pk, i211719@nu.edu.pk"
            )
        }

        failure {
            echo '❌ Deployment Failed! Check logs for errors.'
            emailext (
                subject: "❌ Jenkins Deployment Failed!",
                body: "The deployment of MLOps app has failed. Please check Jenkins logs for details.",
                to: "i212691@nu.edu.pk, i211719@nu.edu.pk"
            )
        }
    }
}
