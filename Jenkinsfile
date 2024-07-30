pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION = 'us-west-2'
        GIT_REPO = 'https://github.com/i-dipanshu/devops-session-project-24'
        GIT_BRANCH = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: GIT_BRANCH, url: GIT_REPO
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // export terraform variable
                    alias terraform="/opt/homebrew/bin/terraform" // for my mac

                    // Setup Terraform
                    sh "terraform --version"
                    
                    // Initialize Terraform
                    dir(TERRAFORM_DIR) {
                        sh "terraform init"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply Terraform configuration
                    dir(TERRAFORM_DIR) {
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage('Testing') {
            steps {
                script {
                    // Retrieve outputs from Terraform
                    def publicInstancePublicIp = sh(script: "terraform output -raw public_instance_public_ip", returnStdout: true).trim()

                    // Print outputs for verification
                    sh "terraform output"

                    // Perform testing
                    // Example curl request to the public instance
                    sh "curl http://${publicInstancePublicIp}:80" // Adjust port as necessary
                }
            }
        }
    }
}
