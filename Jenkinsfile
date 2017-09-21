node {
    
    checkout scm

    imageName = "mule-jenkins-kubernetes-demo"

		stage('Build') {
	
                sh "mvn clean package -DskipTests=true"
            		
		}
        stage('Build and Push') {



                    def customImage = docker.build("${imageName}", "-f DockerfileForApp/Dockerfile .").inside("--volume=/var/run/docker.sock:/var/run/docker.sock") {
			sh 'echo hello'
		    
	
		}

        stage('Deploy') {

                sh "kubectl create -f app-deployment.yaml"
                sh "kubectl create -f app-service.yaml"	
		}
}
