#!/bin/bash

echo jenkins-course-maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven/
WORKSPACE2=/Users/jose-ignacio.martin/learning/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

echo "*** current path $WORKSPACE ****"
echo "*** current path $WORKSPACE2 ****"
ls -la $WORKSPACE
ls -la $WORKSPACE2
docker cp /tmp/.auth centos-remote-host:/tmp/.auth
docker cp $WORKSPACE/jenkins/deploy/publish centos-remote-host:/tmp/publish
docker cp $WORKSPACE2/jenkins/deploy/docker-compose.yml centos-remote-host:/tmp/docker-compose.yml
docker exec -it centos-remote-host bash /tmp/publish
