node {
    
    checkout scm

    imageName = "mule-jenkins-kubernetes-demo"

		stage('Build') {
			steps {
                sh "mvn clean package"
            }		
		}
        stage('Build and Push') {
			steps {

                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    def customImage = docker.build("${imageName}", "-f DockerfileForApp/Dockerfile .")
                    customImage.push()
                }

            }		
		}

        stage('Deploy') {
			steps {
                sh "kubectl create -f app-deployment.yaml"
                sh "kubectl create -f app-service.yaml"
            }		
		}
}
