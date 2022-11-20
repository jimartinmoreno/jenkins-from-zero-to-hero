# Creates a docker container that runs Jenkins, Docker and Ansible inside 
FROM jenkins/jenkins

USER root

# Install ansible
RUN apt update -y

RUN apt install -y python3-pip
RUN pip3 install ansible
RUN apt-get install -y iputils-ping

# Install Docker

RUN apt-get update
RUN apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update -y
RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN apt-get update -y
RUN apt-get install -y sudo

RUN sudo usermod -aG docker jenkins

# change docker sock permissions after moutn
RUN if [ -e /var/run/docker.sock ]; then sudo chown jenkins:jenkins /var/run/docker.sock; fi

USER jenkins

