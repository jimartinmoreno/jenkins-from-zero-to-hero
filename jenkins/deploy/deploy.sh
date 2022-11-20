#!/bin/bash

echo jenkins-course-maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

WORKSPACE_PATH=/var/jenkins_home/workspace/pipeline-docker-maven/

echo "*** WORKSPACE_PATH: $WORKSPACE_PATH ****"
echo "*** WORKSPACE: $WORKSPACE ****"

docker cp /tmp/.auth centos-remote-host:/tmp/.auth
docker cp $WORKSPACE/jenkins/deploy/publish centos-remote-host:/tmp/publish
docker cp $WORKSPACE/jenkins/deploy/docker-compose.yml centos-remote-host:/tmp/docker-compose.yml
docker exec centos-remote-host bash /tmp/publish
