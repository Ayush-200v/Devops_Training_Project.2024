# Devops session 2024 Project

This project demonstrates a two-tier architecture using Terraform for provisioning infrastructure and Jenkins for continuous integration and deployment. The deployment includes a Flask application running in a Docker container and a MySQL database also running in a Docker container.

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker
- Git (optional, for cloning the repository)
- Terraform
- Jenkins

## Setup

1. **Clone this repository** (if you haven't already):

   ```bash
   git clone https://github.com/i-dipanshu/devops-session-project-24
   ```

2. **Navigate to the project directory**:

   ```bash
   cd devops-session-project-24
   ```

## Infrastructure and Application Deployment

### Using Jenkins and Terraform

1. **Configure Jenkins**:

   - Ensure Jenkins agent has Terraform installed
   - Add AWS credentials

2. **Run the Jenkins Pipeline**:

   - The Jenkins pipeline, defined in the `Jenkinsfile`, will handle the deployment of the infrastructure and applications.
   - The pipeline will perform the following stages:
     - **Checkout**: Clone the repository.
     - **Terraform Init**: Initialize the Terraform configuration.
     - **Terraform Apply**: Apply the Terraform configuration to provision AWS resources and deploy Docker containers.
     - **Testing**: Retrieve Terraform outputs, display public IPs, and perform basic testing of the frontend application.

### File Descriptions

- **Dockerfile.frontend**: Dockerfile for building the frontend application image.
- **Jenkinsfile**: Jenkins pipeline configuration file for managing deployment.
- **app.py**: Main Flask application file.
- **terraform/**: Directory containing Terraform configuration files for infrastructure setup.

## Manual Testing

1. **After Jenkins Pipeline Execution**:
   - Access the frontend application through the public IP or DNS provided by Terraform outputs.
   - Submit a message and verify it appears on the frontend.
   - Check the MySQL database to ensure the message has been stored correctly.