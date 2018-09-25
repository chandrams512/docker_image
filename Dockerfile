FROM ubuntu:16.04

WORKDIR /ROOT

#RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
#RUN echo "LANG=en_US.UTF-8" >> /etc/environment
RUN echo "NODE_ENV=development" >> /etc/environment
RUN more "/etc/environment"
#RUN locale-gen en_US en_US.UTF-8
#RUN dpkg-reconfigure locales
RUN apt-get autoclean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install --yes curl htop git zip nano ncdu build-essential chrpath libssl-dev libxft-dev pkg-config glib2.0-dev libexpat1-dev gobject-introspection python-gi-dev


# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs

COPY config/*  /tmp/
ADD DockerNodeJS /DockerNodeJS
RUN mv /tmp/package.json /package.json
#RUN mv /tmp/DockerProject/* /DockerProject
RUN npm install --save angular
RUN node -v
RUN npm -v
RUN npm i -g nodemon
RUN nodemon -v
#RUN apt-get statement DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y install postgresql postgresql-client postgresql-contrib
#RUN pg_createcluster -u postgres
#USER postgres
#RUN npm install pg -g
#RUN pg_createcluster 9.3 main --start
#RUN /etc/init.d/postgresql start \
 #   && psql --command "CREATE USER pguser WITH SUPERUSER PASSWORD 'pguser';" \
  #  && createdb -O pguser pgdb

#USER root
#RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf
#RUN echo "listen_addresses='*'" >> /etc/postgresql/9.6/main/postgresql.conf

#EXPOSE 5432

#RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]


#USER postgres
#CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]
