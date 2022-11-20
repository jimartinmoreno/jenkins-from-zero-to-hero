#!/bin/bash

# Runs a maven container to build and package the java project 

# echo "***************************"
# echo "** Building jar ***********"
# echo "***************************"

# WORKSPACE=/Users/jose-ignacio.martin/learning/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

# docker run --rm  -v  $WORKSPACE/java-app:/app -v $HOME/.m2/:/root/.m2/ -w /app  maven:3.6.0-jdk-11-slim "$@"

echo "*****************************************************************************"
echo "**************                    Building jar                    ***********"
echo "** Usage: ./jenkins/build/mvn.sh  mvn -B -DskipTests clean install package **"
echo "*****************************************************************************"

docker run --rm -v $PWD/java-app:/app -v $HOME/.m2/:/root/.m2/ -w /app maven:3.6.0-jdk-11-slim "$@"