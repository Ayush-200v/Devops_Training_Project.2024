pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        TERRAFORM_DIR = "terraform"
        AWS_DEFAULT_REGION = 'us-west-2'
        GIT_REPO = 'https://github.com/i-dipanshu/devops-session-project-24'
        GIT_BRANCH = 'main'
        PATH = "/opt/homebrew/bin:${env.PATH}"
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

                    dir(TERRAFORM_DIR) {
                        // Retrieve outputs from Terraform
                        def publicInstancePublicIp = sh(script: "terraform output -raw public_instance_public_ip", returnStdout: true).trim()

                        // Print outputs for verification
                        sh "terraform output"

                        // Perform testing
                        // Example curl request to the public instance
                        // Perform testing with retries
                        def maxRetries = 20
                        def retryInterval = 10 // seconds
                        def success = false

                        for (int i = 0; i < maxRetries; i++) {
                            def response = sh(script: "curl -s -o /dev/null -w \"%{http_code}\" http://${publicInstancePublicIp}:80", returnStdout: true).trim()
                            if (response == '200') {
                                echo "Frontend application is up and running."
                                success = true
                                break
                            } else {
                                echo "Attempt ${i+1} failed. Retrying in ${retryInterval} seconds..."
                                sleep(retryInterval)
                            }
                        }

                        if (!success) {
                            error "Frontend application is not reachable after ${maxRetries * retryInterval} seconds."
                        }
                    }
                }
            }
        }
    }
}
