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

WORKDIR "/home"
RUN wget https://raw.githubusercontent.com/mindevis/dcr-l2jmobius/master/req.sh && chmod +x req.sh && bash req.sh
WORKDIR "/home/l2j_mobius"
RUN wget https://raw.githubusercontent.com/mindevis/dcr-l2jmobius/master/compile.sh && chmod +x compile.sh
ENTRYPOINT [ "./compile.sh" ]
CMD [ "$1" ]