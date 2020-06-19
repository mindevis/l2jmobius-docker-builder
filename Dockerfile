FROM debian

LABEL maintainer="mindevis.by@gmail.com" version="1.0" description="Compiling L2jMobius in Docker container"
SHELL [ "/bin/bash", "-c" ]
USER root:root

# ENV ARGS -----
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/apache-ant-1.10.8/bin:/opt/jdk-14.0.1/bin
# ENV ARGS -----

# Update system and clear caches
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git wget -y && \
apt-get autoclean && apt-get autoremove && \
rm -rf /var/lib/apt/lists/*

# Downloading and installing needed components for compiling sources
WORKDIR "/home"
RUN wget https://mirror.datacenter.by/pub/apache.org//ant/binaries/apache-ant-1.10.8-bin.tar.gz && \
tar -xvf apache-ant-1.10.8-bin.tar.gz -C /opt && \
wget https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz && \
tar -xvf openjdk-14.0.1_linux-x64_bin.tar.gz -C /opt && \
git clone https://bitbucket.org/MobiusDev/l2j_mobius.git

WORKDIR "/home/l2j_mobius"
RUN wget https://raw.githubusercontent.com/mindevis/dcr-l2jmobius/master/compile.sh && chmod +x compile.sh
ENTRYPOINT [ "./compile.sh" ]
CMD [ "$1" ]