#! /bin/bash

echo "Clone repository"
git clone https://bitbucket.org/MobiusDev/l2j_mobius.git

echo "Download latest Apache Ant Compiller"
wget https://mirror.datacenter.by/pub/apache.org//ant/binaries/apache-ant-1.10.11-bin.tar.gz
echo "Download JDK 15 GA"
wget https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz

tar -xvf apache-ant-1.10.11-bin.tar.gz -C /opt
tar -xvf openjdk-15.0.2_linux-x64_bin.tar.gz -C /opt

ln -s /root/l2j_mobius /home/l2j_mobius

ant -f /home/l2j_mobius/$1/build.xml