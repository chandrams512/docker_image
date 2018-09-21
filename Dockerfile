FROM ubuntu:16.04

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
 
# Install Java and Python
RUN apt-get update && apt-get install -y openjdk-8-jdk
RUN apt-get install python -y

#Install Packages
RUN echo "NODE_ENV=development" >> /etc/environment
RUN more "/etc/environment"
RUN apt-get autoclean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install tar sudo curl htop git zip nano ncdu build-essential chrpath libssl-dev libxft-dev pkg-config glib2.0-dev libexpat1-dev gobject-introspection python-gi$


# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs

COPY config/*  /tmp/


RUN mv /tmp/package.json /package.json


# Install angular js
RUN npm install --save angular
RUN node -v
RUN npm -v
RUN npm i -g nodemon
RUN nodemon -v

#Install Logstash

RUN curl -fL https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz | tar xzf - -C /opt && \
mv /opt/logstash-1.5.4 /opt/logstash

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/logstash/bin

#Install postgres

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN apt-get update && apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y -f install postgresql postgresql-client postgresql-contrib

EXPOSE 5432

