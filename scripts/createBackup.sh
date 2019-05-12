#!/bin/bash

# Prepare a backup of all necessary Jenkins configs, users, and jobs files

BACKUP_DIR=temp_backup
rm -rdf ${BACKUP_DIR}
mkdir ${BACKUP_DIR}

WORKDIR=$(pwd)/..
JENKINS_HOME_DIR=${WORKDIR}/jenkins_home

pushd ${JENKINS_HOME_DIR}
echo $(pwd)
cp config.xml ${WORKDIR}/scripts/${BACKUP_DIR}/
cp -R users ${WORKDIR}/scripts/${BACKUP_DIR}/
cp -R jobs ${WORKDIR}/scripts/${BACKUP_DIR}/