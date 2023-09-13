FROM gcc:latest

VOLUME "/home/project"
WORKDIR "/home/project"

## APT
RUN  apt-get update &&\ 
     apt-get install -y --no-install-recommends apt-utils

## CMAKE
RUN apt install -y --no-install-recommends cmake
