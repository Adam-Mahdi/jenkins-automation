pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Adam-Mahdi/jenkins-automation.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                script {
                    if (isUnix()) {
                        // Unix-specific command for initialization
                        sh 'terraform init'
                    } else {
                        // Windows-specific command for initialization
                        bat 'terraform init'
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                script {
                    if (isUnix()) {
                        // Unix-specific command to apply terraform
                        sh 'terraform apply -auto-approve'
                    } else {
                        // Windows-specific command to apply terraform
                        bat 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
