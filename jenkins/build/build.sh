#!/bin/bash

echo "****************************"
echo "** Creating the new jar  ***"
echo "****************************"

./jenkins/build/mvn.sh  mvn -B -DskipTests test install package

echo "****************************"
echo "** Copy the new jar      ***"
echo "****************************"

# Copy the new jar to the build location
cp -f java-app/target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
