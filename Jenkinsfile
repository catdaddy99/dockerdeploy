
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
        stage('Sleep for Server Boot') {
            steps {
              script {
                  print('60 secs to let the servers boot')
                  sleep(60)    
              }
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
        stage('Ansible Apt Update'){
          steps{
              ansiblePlaybook become: true, credentialsId: '3b07289c-0df1-4dcc-9be5-334ab10bef8e', disableHostKeyChecking: true, installation: 'ansible', inventory: './ansible/inventory/hosts', playbook: './ansible/playbooks/aptupdate.yaml', vaultTmpPath: ''
          }
        }
        stage('Ansible Standard Software Install'){
          steps{
              ansiblePlaybook become: true, credentialsId: '3b07289c-0df1-4dcc-9be5-334ab10bef8e', disableHostKeyChecking: true, installation: 'ansible', inventory: './ansible/inventory/hosts', playbook: './ansible/playbooks/standardsoftwareinstall.yaml', vaultTmpPath: ''
          }
        }  
        stage('Docker CE Install'){
          steps{
              ansiblePlaybook become: true, credentialsId: '3b07289c-0df1-4dcc-9be5-334ab10bef8e', disableHostKeyChecking: true, installation: 'ansible', inventory: './ansible/inventory/hosts', playbook: './ansible/playbooks/dockerinstall.yaml', vaultTmpPath: ''
          }          
        } 
      }       
    }
