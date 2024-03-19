pipeline {
    agent any
    def image
    def mvnHome = tool 'Maven3'

    stages {
        stage ("Fetch Code"){
            steps {
                git branch: 'main', url: 'https://github.com/rofiqirapsanjani/pintar-repo.git'
                sh ('cd pintar-repo')
            }
        }
        stage ('build')  {
            steps{
                sh('${mvnHome}/bin/mvn package -f pom.xml')
            }
        } 
    
        stage ('Docker Build') {
     // Build and push image with Jenkins' docker-plugin
            withDockerRegistry([credentialsId: "dockerhub", url: "https://index.docker.io/v1/"]) {
            sh('docker build -t mywebapp:v1 .')
            image.push()  
            }
        }
    
        stage ('Kubernetes Deploy') {

            steps{
                sh ('kubectl apply -f Deployment.yaml')
            }
        }

    }
}
