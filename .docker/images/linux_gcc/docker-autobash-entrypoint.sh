#!/bin/bash

if [ -z ${GCC_FOLDER_PROJECT} ]
then
    GCC_FOLDER_PROJECT=/home/project/
fi

if [ -z ${PHP_FOLDER_LOG} ]
then
    GCC_FOLDER_LOG=/var/log/docker/gcc/
fi

if [ -z ${JAVA_FOLDER_INIT} ]
then
    JAVA_FOLDER_INIT="/var/docker/java/"
fi

${JAVA_FOLDER_INIT}/importdata.sh 2>> ${JAVA_FOLDER_LOG}/installdata.log

cp ${CRON_FOLDER_INIT}/dockercron /etc/cron.d/dockercron

crontab /etc/cron.d/dockercron

#while inotifywait -e close_write /etc/cron.d/dockercron; do crontab /etc/cron.d/dockercron; done &

crontab /etc/cron.d/dockercron

${CRON_FOLDER_INIT}/cronauto.sh 2>> ${JAVA_FOLDER_LOG}/initnodejs.log &

touch ${JAVA_FOLDER_LOG}/cron.log
cron && tail -f ${JAVA_FOLDER_LOG}/cron.log &

touch ${GCC_FOLDER_LOG}/error.log
service startautobash start && tail -F ${GCC_FOLDER_LOG}/error.log &

echo "end create project" >> ${JAVA_FOLDER_LOG}/endcreate.log

exec "$@"
