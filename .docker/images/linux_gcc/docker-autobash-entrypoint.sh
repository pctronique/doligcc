#!/bin/bash

if [ -z ${GCC_FOLDER_PROJECT} ]
then
    GCC_FOLDER_PROJECT=/home/project/
fi

if [ -z ${PHP_FOLDER_LOG} ]
then
    GCC_FOLDER_LOG=/var/log/docker/gcc/
fi

if [ -z ${GCC_FOLDER_INIT} ]
then
    GCC_FOLDER_INIT="/var/docker/gcc/"
fi

${GCC_FOLDER_INIT}/importdata.sh 2>> ${GCC_FOLDER_LOG}/installdata.log

cp ${CRON_FOLDER_INIT}/dockercron /etc/cron.d/dockercron

crontab /etc/cron.d/dockercron

#while inotifywait -e close_write /etc/cron.d/dockercron; do crontab /etc/cron.d/dockercron; done &

crontab /etc/cron.d/dockercron

${CRON_FOLDER_INIT}/cronauto.sh 2>> ${GCC_FOLDER_LOG}/initnodejs.log &

touch ${GCC_FOLDER_LOG}/cron.log
cron && tail -f ${GCC_FOLDER_LOG}/cron.log &

touch ${GCC_FOLDER_LOG}/error.log
service startautobash start && tail -F ${GCC_FOLDER_LOG}/error.log &

echo "end create project" >> ${GCC_FOLDER_LOG}/endcreate.log

exec "$@"
