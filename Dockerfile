FROM ubuntu:16.04

WORKDIR /ROOT

RUN export LANGUAGE="en_US.UTF-8"
RUN echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
RUN echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

RUN apt-get autoclean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install --yes sudo wget tar curl htop git zip nano ncdu build-essential chrpath libssl-dev libxft-dev pkg-config glib2.0-dev libexpat1-dev gobject-introspection python-gi-dev

#Install Java
RUN apt-get update && apt-get install -y openjdk-8-jdk

#Install Python

RUN apt-get update && \
    apt-get install -y python python-dev python3-pip python-virtualenv && \
    rm -rf /var/lib/apt/lists/*

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


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y install postgresql postgresql-client postgresql-contrib

EXPOSE 5432

#Install AWS cli
RUN pip3 install awscli

#Install Logstash
RUN curl -fL https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz | tar xzf - -C /opt && \
    mv /opt/logstash-1.5.4 /opt/logstash

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/logstash/bin
