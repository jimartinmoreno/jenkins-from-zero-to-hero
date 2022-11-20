#!/bin/bash

echo "***************************"
echo "** Testing the code *******"
echo "***************************"
WORKSPACE=/Users/jose-ignacio.martin/learning/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

docker run --rm  -v  $WORKSPACE/java-app:/app -v $HOME/.m2/:/root/.m2/ -w /app maven:3.6.0-jdk-11-slim "$@"
