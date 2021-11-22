pipeline {
     agent any
        environment {
       
        registry = "19931/python"
        
        registryCredential = '19932'
        dockerImage = ''
    }
    stages {

        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'mygit', url: 'https://github.com/guiassamohammed/Python-CI-CD-app-']]])
            }
        }
       
        stage ('Build docker image') {
            steps {
                script {
                dockerImage = docker.build registry
                }
            }
        }
       
         // Uploading Docker images into Docker Hub
    stage('push  to Docker') {
     steps{   
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
   
    stage ('K8S Deploy') {
        steps {
            script {
                kubernetesDeploy(
                    configs: 'myku.yaml',
                    kubeconfigId: 'AKS',
                    enableConfigSubstitution: true
                    )           
               
            }
        }
    }
  
    }  
}
