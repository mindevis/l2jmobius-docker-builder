FROM debian

LABEL maintainer="mindevis.by@gmail.com" version="1.0" description="Compiling L2jMobius in Docker container"
SHELL [ "/bin/bash", "-c" ]
USER root:root
VOLUME [ "/home" ]

# MAIN ARGS ----
ARG OPT_HOME="/opt"
ARG HOME="/home"

ARG SOURCES="${HOME}/l2j_mobius"
ARG BUILD="${HOME}/build"

ARG ANT_HOME="${OPT_HOME}/apache-ant-1.10.8"
ARG JAVA_HOME="${OPT_HOME}/jdk-14.0.1"

ARG DW_ANT="https://mirror.datacenter.by/pub/apache.org//ant/binaries/apache-ant-1.10.8-bin.tar.gz"
ARG TR_ANT="-xvf apache-ant-1.10.8-bin.tar.gz -C ${OPT_HOME}"
ARG DW_JDK="https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz"
ARG TR_JDK="-xvf openjdk-14.0.1_linux-x64_bin.tar.gz -C ${OPT_HOME}"

ARG DW_SOURCES="https://bitbucket.org/MobiusDev/l2j_mobius.git"
# MAIN ARGS ----

# ENV ARGS -----
ENV ANT_HOME=${ANT_HOME}
ENV JAVA_HOME=${JAVA_HOME}
ENV JDK_HOME=${JAVA_HOME}
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/apache-ant-1.10.8/bin:/opt/jdk-14.0.1/bin
# ENV ARGS -----

# Update system and clear caches
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git wget -y && \
apt-get autoclean && apt-get autoremove && \
rm -rf /var/lib/apt/lists/*

# Downloading and installing needed components for compiling sources
WORKDIR ${HOME}
RUN wget ${DW_ANT} && \
tar ${TR_ANT} && \
wget ${DW_JDK} && \
tar ${TR_JDK} && \
git clone ${DW_SOURCES}