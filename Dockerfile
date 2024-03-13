FROM openjdk:17-alpine

LABEL maintainer="mindevis.by@gmail.com" version="3.0" description="Compiling L2jMobius in Docker container"
SHELL [ "/bin/sh", "-c" ]
USER root:root

RUN apk add --no-cache git \
    && apk add --no-cache wget \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

ENV PATH=/opt/openjdk-17/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/apache-ant-1.10.14/bin
ENV JAVA_HOME=/opt/openjdk-17
ENV JAVA_VERSION=17-ea+14

WORKDIR "/root"
RUN echo -e '#! /bin/sh \n\
wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.10.14-bin.tar.gz \n\
git clone https://bitbucket.org/MobiusDev/l2j_mobius.git \n\
tar -xvf apache-ant-1.10.14-bin.tar.gz -C /opt \n\
rm -rf apache-ant-1.10.14-bin.tar.gz'\
> req.sh && chmod +x req.sh

RUN echo -e '#! /bin/sh \n\
sh /root/req.sh \n\
ant -f /root/l2j_mobius/$1/build.xml \n\
cp /root/l2j_mobius/build/$1.zip /home/$1.zip '\
> compile.sh && chmod +x compile.sh

ENTRYPOINT [ "./compile.sh" ]
CMD [ "$1" ]
