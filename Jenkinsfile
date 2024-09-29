pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
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
                        sh 'terraform init'
                    } else {
                        bat 'terraform init'
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'terraform apply -auto-approve'
                    } else {
                        bat 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
