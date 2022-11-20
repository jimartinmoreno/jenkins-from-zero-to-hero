#!/bin/bash

echo jenkins-course-maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

WORKSPACE_PATH=/var/jenkins_home/workspace/pipeline-docker-maven/

echo "*** Path $WORKSPACE_PATH ****"

docker cp /tmp/.auth centos-remote-host:/tmp/.auth
docker cp $WORKSPACE_PATH/jenkins/deploy/publish centos-remote-host:/tmp/publish
docker cp $WORKSPACE_PATH/jenkins/deploy/docker-compose.yml centos-remote-host:/tmp/docker-compose.yml
docker exec -it centos-remote-host bash /tmp/publish
