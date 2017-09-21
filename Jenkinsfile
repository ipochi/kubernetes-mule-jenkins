node {
    
    checkout scm

    imageName = "mule-jenkins-kubernetes-demo"

		stage('Build') {
	
                sh "mvn clean package -DskipTests=true"
            		
		}
        stage('Build and Push') {


                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    def customImage = docker.build("${imageName}", "--volume=/var/run/docker.sock:/var/run/docker.sock -f DockerfileForApp/Dockerfile .)
                }
	
		}

        stage('Deploy') {

                sh "kubectl create -f app-deployment.yaml"
                sh "kubectl create -f app-service.yaml"	
		}
}
