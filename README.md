# Dockerized Jenkins
Dockerfile to standup a Jenkins master

# Getting started
- Edit dockerfile to use desired Jenkins version
- Edit pluginList.txt to use desired Jenkins plugins

# Start Jenkins inside a docker container
```
./start-jenkins.sh
```

This will create a JENKINS_HOME directory in the current working directory.
The container will use this directory as a persistent volume.
