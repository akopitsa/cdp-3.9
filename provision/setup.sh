#!/bin/bash

echo "Starting ..."
sudo apt-get update -y
#sudo apt-get upgrade -y
# echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
# echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

# # Accept license non-iteractive
# echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
# Make sure Java 8 becomes default java
#apt-get install -y oracle-java8-set-default
sudo apt-get install -y openjdk-8-jdk
# echo 'JAVA_HOME=/usr/lib/jvm/java-8-oracle' > /etc/environment
# echo 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin' >> /etc/environment
sudo apt-get install  mc vim-nox maven git -y
mkdir /var/log/zookeeper
mkdir /home/ubuntu/zookeeper
cd /home/ubuntu/zookeeper && wget http://apache.cp.if.ua/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz && tar -xzvf zookeeper-3.4.11.tar.gz && cd zookeeper-3.4.11/ && cp conf/zoo_sample.cfg conf/zoo.cfg && echo "dataLogDir=/var/log/zookeeper" >> conf/zoo.cfg && bin/zkServer.sh start &
mkdir /home/ubuntu/exhibitor
echo """zookeeper-data-directory=/tmp/zookeeper
zookeeper-install-directory=/home/ubuntu/zookeeper/zookeeper-3.4.11
client-port=2181
connect-port=2888
election-port=3888
auto-manage-instances=1
auto-manage-instances-settling-period-ms=18000
#auto-manage-instances-fixed-ensemble-size=3
zookeeper-log-directory=/var/log/zookeeper
#servers-spec=1\:zookeeperhost-1,2\:zookeeperhost-2,3\:zookeeperhost-3
""" >> /home/ubuntu/exhibitor/exhibitor.properties

if [ $1 == "192.168.99.42" ]; then
#   sed -i 's/initLimit=10/initLimit=5/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/syncLimit=5/syncLimit=2/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/# dataLogDir=\/disk2\/zookeeper/dataLogDir=\/var\/log\/zookeeper/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.1=zookeeper1:2888:3888/server.1=zookeeperhost-1:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.2=zookeeper2:2888:3888/server.2=zookeeperhost-2:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.3=zookeeper3:2888:3888/server.3=zookeeperhost-3:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#  echo "1" > /etc/zookeeper/conf/myid
#  /etc/init.d/zookeeper restart
  cd /home/ubuntu/exhibitor && wget https://raw.github.com/Netflix/exhibitor/master/exhibitor-standalone/src/main/resources/buildscripts/standalone/maven/pom.xml && mvn clean package
  java -jar target/exhibitor-1.6.0.jar -c file --defaultconfig  /home/ubuntu/exhibitor/exhibitor.properties --fsconfigdir /vagrant_data/ --fsconfigname exhibitor-auto.prop --hostname $1 &
fi

if [ $1 == "192.168.99.43" ]; then
#   sed -i 's/initLimit=10/initLimit=5/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/syncLimit=5/syncLimit=2/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/# dataLogDir=\/disk2\/zookeeper/dataLogDir=\/var\/log\/zookeeper/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.1=zookeeper1:2888:3888/server.1=zookeeperhost-1:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.2=zookeeper2:2888:3888/server.2=zookeeperhost-2:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.3=zookeeper3:2888:3888/server.3=zookeeperhost-3:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#  echo "2" > /etc/zookeeper/conf/myid
#  /etc/init.d/zookeeper restart

  cd /home/ubuntu/exhibitor && wget https://raw.github.com/Netflix/exhibitor/master/exhibitor-standalone/src/main/resources/buildscripts/standalone/maven/pom.xml && mvn clean package
  java -jar target/exhibitor-1.6.0.jar -c file --defaultconfig  /home/ubuntu/exhibitor/exhibitor.properties --fsconfigdir /vagrant_data/ --fsconfigname exhibitor-auto.prop --hostname $1 &
fi

if [ $1 == "192.168.99.44" ]; then
#   sed -i 's/initLimit=10/initLimit=5/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/syncLimit=5/syncLimit=2/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/# dataLogDir=\/disk2\/zookeeper/dataLogDir=\/var\/log\/zookeeper/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.1=zookeeper1:2888:3888/server.1=zookeeperhost-1:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.2=zookeeper2:2888:3888/server.2=zookeeperhost-2:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/#server.3=zookeeper3:2888:3888/server.3=zookeeperhost-3:2888:3888/g'  /etc/zookeeper/conf/zoo.cfg
#  echo "3" > /etc/zookeeper/conf/myid
#  /etc/init.d/zookeeper restart
  cd /home/ubuntu/exhibitor && wget https://raw.github.com/Netflix/exhibitor/master/exhibitor-standalone/src/main/resources/buildscripts/standalone/maven/pom.xml && mvn clean package
  java -jar target/exhibitor-1.6.0.jar -c file --defaultconfig  /home/ubuntu/exhibitor/exhibitor.properties --fsconfigdir /vagrant_data/ --fsconfigname exhibitor-auto.prop --hostname $1 &
fi

# if [ $1 == "192.168.99.45" ]; then
#   sed -i 's/initLimit=10/initLimit=5/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/syncLimit=5/syncLimit=2/g' /etc/zookeeper/conf/zoo.cfg
#   sed -i 's/# dataLogDir=\/disk2\/zookeeper/dataLogDir=\/var\/log\/zookeeper/g' /etc/zookeeper/conf/zoo.cfg
# #  echo "4" > /etc/zookeeper/conf/myid
#   /etc/init.d/zookeeper restart
#   cd /home/ubuntu/exhibitor && wget https://raw.github.com/Netflix/exhibitor/master/exhibitor-standalone/src/main/resources/buildscripts/standalone/maven/pom.xml && mvn clean package
#   java -jar target/exhibitor-1.6.0.jar -c file --defaultconfig  /home/ubuntu/exhibitor/exhibitor.properties --fsconfigdir /vagrant_data/ --fsconfigname exhibitor-auto.prop --hostname $1 &
# fi

