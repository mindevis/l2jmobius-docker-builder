FROM alpine

LABEL maintainer="mindevis.by@gmail.com" version="2.0" description="Compiling L2jMobius in Docker container"
#SHELL [ "/bin/bash", "-c" ]
USER root:root

# ENV ARGS -----
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/apache-ant-1.10.11/bin:/opt/jdk-15.0.2/bin
# ENV ARGS -----

# Update system and clear caches
RUN apk add --upgrade apk-tools && apk upgrade --available && apk add git wget bash

WORKDIR "/root"
RUN wget https://raw.githubusercontent.com/mindevis/dcr-l2jmobius/master/compile.sh && chmod +x compile.sh
ENTRYPOINT [ "./compile.sh" ]
CMD [ "$1" ]