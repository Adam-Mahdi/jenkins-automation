pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Adam-Mahdi/jenkins-automation'  // Replace with your repo
            }
        }
        stage('Initialize Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
