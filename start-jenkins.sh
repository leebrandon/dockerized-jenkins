#!/bin/bash
PORT=8080
WORKINGDIR=$(pwd)
JENKINS_HOME=$WORKINGDIR/jenkins_home
JOBDSL_HOME=$WORKINGDIR/job-dsl
IMAGE_NAME=jenkins-master:lts
CONTAINER_NAME=jenkins-master-test

# Look for jenkins docker image, build it if not found
if [ -z $(docker images -q jenkins-master:lts) ]; then
  echo "No jenkins docker image found.  Building it now..."
  docker build -t jenkins-master:lts docker
else
  echo "Jenkins docker image found"
fi

# Remove existing container
RUNNING_CONTAINERS=$(docker ps -aq -f name=$CONTAINER_NAME)
if [ ! -z $RUNNING_CONTAINERS ]; then
  docker rm -f $RUNNING_CONTAINERS
fi

# Start docker container
echo "Starting Jenkins docker container, this may take a few minutes."
echo "Jenkins will be available on http://localhost:8081"
docker run -p 8081:$PORT \
            --name $CONTAINER_NAME \
            -v $JENKINS_HOME:/var/jenkins_home/:rw \
            -v $JOBDSL_HOME:/usr/share/job-dsl:rw -i -t \
            $IMAGE_NAME /usr/local/bin/jenkins.sh
