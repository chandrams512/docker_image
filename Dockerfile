FROM ubuntu:16.04

WORKDIR /ROOT


RUN apt-get autoclean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install --yes sudo wget tar curl htop git zip nano ncdu build-essential chrpath libssl-dev libxft-dev pkg-config glib2.0-dev libexpat1-dev gobject-introspection python-gi-dev

#Install GIT
RUN apt-get install git-core

#Install Java
RUN apt-get install -y openjdk-8-jdk

#Install Python

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip


#Install Spark
RUN wget http://www-eu.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz && \
    tar -xzvf spark-2.3.1-bin-hadoop2.7.tgz && \
    mv spark-2.3.1-bin-hadoop2.7 /usr/local/spark && \
    rm spark-2.3.1-bin-hadoop2.7.tgz
 
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs

#packages configure
COPY config/*  /tmp/
ADD config/DockerNodeJS /DockerNodeJS
RUN mv /tmp/package.json /package.json

#Install angular
RUN npm install --save angular
RUN node -v
RUN npm -v
RUN npm i -g nodemon
RUN nodemon -v

#Install Postgres

RUN apt-get update && apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y install postgresql postgresql-client postgresql-contrib

EXPOSE 5432

#Install AWS cli
RUN pip3 install awscli

#Install AZURE Cli
RUN pip install azure-cli

#Install Logstash
RUN curl -fL https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz | tar xzf - -C /opt && \
    mv /opt/logstash-1.5.4 /opt/logstash

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/logstash/bin


#Install Ranger
#Install Maven 3.3.0+
RUN mkdir -p /opt/maven
WORKDIR /opt/maven
RUN wget http://download.nextag.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar -xvzf /opt/maven/apache-maven-3.3.9-bin.tar.gz
RUN rm -rf /opt/maven/apache-maven-3.3.9-bin.tar.gz

ENV M2_HOME /opt/maven/apache-maven-3.3.9
ENV MAVEN_OPTS -Xmx2048m
ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin


# SSH key
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
#RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config


RUN git clone https://github.com/apache/incubator-ranger

#RUN mvn dependency:resolve

WORKDIR /ROOT


