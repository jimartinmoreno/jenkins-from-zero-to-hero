#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="jenkins-course-maven-project"
echo "** IMAGE: $IMAGE ***"

echo "** Logging in jimartin7 ***"
docker login -u jimartin7 -p $PASS
echo "*** Tagging image with tag: $BUILD_TAG ***"
docker tag $IMAGE:$BUILD_TAG jimartin7/$IMAGE:$BUILD_TAG
echo "*** Pushing image jimartin7/$IMAGE:$BUILD_TAG ***"
docker push jimartin7/$IMAGE:$BUILD_TAG
