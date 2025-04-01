
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
                sh label: '', script: 'terraform apply --auto-approve'
            }
        }
        stage('Ansible Bootstrap'){
          steps{
              ansiblePlaybook become: true, credentialsId: '3b07289c-0df1-4dcc-9be5-334ab10bef8e', disableHostKeyChecking: true, installation: 'ansible', inventory: './ansible/inventory/hosts', playbook: './ansible/playbooks/bootstrap.yaml', vaultTmpPath: ''
          }
        }
                stage('Ansible Ping'){
          steps{
              ansiblePlaybook credentialsId: '3b07289c-0df1-4dcc-9be5-334ab10bef8e', disableHostKeyChecking: true, installation: 'ansible', inventory: './ansible/inventory/hosts', playbook: './ansible/playbooks/ping.yaml', vaultTmpPath: ''
          }
        }
      }       
    }
