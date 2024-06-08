#!/bin/bash

if [ -z ${GCC_FOLDER_PROJECT} ]
then
    GCC_FOLDER_PROJECT=/home/project/
fi

if [ -z ${GCC_FOLDER_LOG} ]
then
    GCC_FOLDER_LOG=/var/log/docker/java/
fi

if [ -z ${GCC_FOLDER_DATA} ]
then
    GCC_FOLDER_DATA=data
fi

if [ -z ${GCC_FOLDER_INIT_DATA} ]
then
    GCC_FOLDER_INIT_DATA=/docker-entrypoint-initdata.d/
fi

if [ ! -d "${GCC_FOLDER_PROJECT}/${GCC_FOLDER_DATA}" ]; then
    if [ ! -z "$(ls -A ${GCC_FOLDER_INIT_DATA})" ]; then
        mkdir -p "${GCC_FOLDER_PROJECT}/${GCC_FOLDER_DATA}" 2>> ${GCC_FOLDER_LOG}/installdata.log
        cp -r ${GCC_FOLDER_INIT_DATA}/* "${GCC_FOLDER_PROJECT}/${GCC_FOLDER_DATA}/" 2>> ${GCC_FOLDER_LOG}/installdata.log
        chmod 777 -R "${GCC_FOLDER_PROJECT}/${GCC_FOLDER_DATA}"
    fi
fi

exit 0
