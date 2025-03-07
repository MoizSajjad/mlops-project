pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'moizsajjad/mlops-app'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    git branch: 'dev', url: 'https://github.com/MoizSajjad/mlops-project.git'
                }
                bat 'git pull origin dev'  // Ensures latest code is pulled
            }
        }

        stage('Verify Files in Workspace') {
            steps {
                bat 'dir'  // Lists files to confirm Dockerfile exists
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
                bat "docker run -d -p 5000:5000 %DOCKER_IMAGE%"
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'

            // Send email notification for success
            emailext (
                subject: "✅ Jenkins Deployment Successful!",
                body: "The deployment of MLOps app was successful!\n\nCheck the deployed app at http://localhost:5000",
                to: "i212691@nu.edu.pk, i211719@nu.edu.pk"
            )
        }

        failure {
            echo '❌ Deployment Failed! Check logs for errors.'

            // Send email notification for failure
            emailext (
                subject: "❌ Jenkins Deployment Failed!",
                body: "The deployment of MLOps app has failed. Please check Jenkins logs for details.",
                to: "i212691@nu.edu.pk, i211719@nu.edu.pk"
            )
        }
    }
}
