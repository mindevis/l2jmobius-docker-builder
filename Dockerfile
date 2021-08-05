FROM debian

LABEL maintainer="mindevis.by@gmail.com" version="2.0" description="Compiling L2jMobius in Docker container"
SHELL [ "/bin/bash", "-c" ]
USER root:root

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git wget -y && \
apt-get autoclean && apt-get autoremove && \
rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/apache-ant-1.10.11/bin:/opt/jdk-15.0.2/bin

WORKDIR "/root"
RUN echo -e '#! /bin/bash \n\
wget https://mirror.datacenter.by/pub/apache.org//ant/binaries/apache-ant-1.10.11-bin.tar.gz \n\
wget https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz \n\
git clone https://bitbucket.org/MobiusDev/l2j_mobius.git \n\
tar -xvf apache-ant-1.10.11-bin.tar.gz -C /opt \n\
tar -xvf openjdk-15.0.2_linux-x64_bin.tar.gz -C /opt \n '\
> req.sh && chmod +x req.sh

RUN echo -e '#! /bin/bash \n\
bash /root/req.sh \n\
ant -f /root/l2j_mobius/$1/build.xml \n\
cp /root/l2j_mobius/build/$1.zip /home/$1.zip '\
> compile.sh && chmod +x compile.sh

ENTRYPOINT [ "./compile.sh" ]
CMD [ "$1" ]