* In Docker Installing and Running 
```
  JAVA 

  PYTHON

  NODEJS

  ANGULARJS

  LOGSTASH

  POSTGRES
```

Here the base Os is Ubuntu 16.04 and JAVA version 1.8

* after local setup and deploy project on Local browser.
  Copy DockerNodeJS project into Docker Config folder with the same Repository Name.

* after successful build Docker.
```
 step 1- service postgresql start.
 step 2- apt-get install sudo.
 step 3- sudo -u postgres psql.
 step 4- ALTER USER postgres PASSWORD 'root';
 step 5- '\q' for exit from postgres database cmd.
 keep database name postgres in all place
```

* Start the node project
```
  node server.js
```

* Browse to **http://localhost:3090**
