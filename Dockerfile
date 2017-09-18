FROM jenkins/jenkins:lts

USER root

# install kubectl
RUN apt-get -y update && apt-get install -y maven && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin

USER jenkins
