ARG VALUE_GCC_VERSION
ARG DEF_GCC_VERSION=${VALUE_GCC_VERSION:-"14.1.0"}

FROM gcc:${DEF_GCC_VERSION}

VOLUME "/home/project"
WORKDIR "/home/project"

## APT
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils

## CMAKE
RUN apt install -y --no-install-recommends cmake

## WIN
RUN apt-get install -y g++-mingw-w64
RUN apt-get install -y gcc-mingw-w64
RUN apt-get install -y mingw-w64
RUN apt-get install -y gcc-multilib
RUN apt-get install -y g++-multilib

#del list
RUN rm -rf /var/lib/apt/lists/*
