pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Adam-Mahdi/jenkins-automation.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                dir('terraform') {
                    // Run Terraform init without nohup
                    bat 'terraform init'  // Use 'bat' for Windows shell commands
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir('terraform') {
                    // Run Terraform apply without nohup
                    bat 'terraform apply -auto-approve' // Use 'bat' for Windows shell commands
                }
            }
        }
    }
}
