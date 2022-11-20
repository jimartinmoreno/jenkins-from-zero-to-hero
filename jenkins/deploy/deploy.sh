#!/bin/bash

echo jenkins-course-maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

docker cp /tmp/.auth centos-remote-host:/tmp/.auth
docker cp ./jenkins/deploy/publish centos-remote-host:/tmp/publish
docker cp ./jenkins/deploy/docker-compose.yml centos-remote-host:/tmp/docker-compose.yml
docker exec -it centos-remote-host bash /tmp/publish
