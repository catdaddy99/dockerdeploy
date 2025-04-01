
pipeline {
    agent any
    tools {
        terraform "terraform"
    }

    stages{
        stage ('Terraform Init') {
            steps {
                sh label: '', script: 'terraform init'
            }
        }
        stage ('Terraform Plan') {
            steps {
                sh label: '', script: 'terraform plan'
            }
        }
        stage ('Terraform Apply') {
        input{
        message "Do you want to proceed for production deployment?"
        }           
            steps {
                sh label: '', script: 'terraform destroy --auto-approve'
            }
        }
      }       
    }
