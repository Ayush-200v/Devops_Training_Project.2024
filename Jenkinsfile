pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION = 'us-west-2'
    }

    stages {
        stage('Create_Infra') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Deploy_Apps') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Test_Solution') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
