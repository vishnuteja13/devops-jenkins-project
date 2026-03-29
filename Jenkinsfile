pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-app"
        DOCKERHUB_CREDENTIALS = "dockerhub-creds"
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure credentialsId matches the ID you created in Jenkins
                git branch: 'main', 
                    credentialsId: 'github_token', 
                    url: 'https://github.com/vishnuteja13/devops-jenkins-project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh "cd app && npm install"
            }
        }

        stage('Test') {
            steps {
                sh "cd app && npm test"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Container') {
            steps {
                // The '|| true' prevents the pipeline from failing if the container isn't already running
                sh "docker run -d -p 3000:3000 ${IMAGE_NAME} || true"
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
