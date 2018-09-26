* In Docker Installing and Running 
```
  GIT
  
  JAVA 

  PYTHON

  NODEJS

  ANGULARJS

  LOGSTASH

  POSTGRES
  
  AWS CLI
  
```

Here the base Os is Ubuntu 16.04 and JAVA version 1.8

* after local setup and deploy project on Local browser.
  Copy DockerNodeJS project into Docker Config folder with the same Repository Name.

* For Docker Build write this command in Dockerfile location
```
docker build -t node .

```
after successful build Docker we run command for creating container

```
docker run -i -t node:latest

```

After successful creation of container,write these command in container

```
 step 1- service postgresql start.
 step 2- sudo -u postgres psql.
 step 3- ALTER USER postgres PASSWORD 'root';
 step 4- 'ctrl+d' for exit from postgres database cmd.
 keep database name postgres in all place
```

* Start the node project
```
  node server.js
```

* Browse to **http://localhost:3090**


*For create instance in AWS
in container write

```
aws configure

```
After this command fill the value of AWS

````
Access key
Secret Access key
Region
Output file format
```

After the AWS configuration we can create new instance with this command

```
aws ec2 run-instances --image-id (imageid) --count 1 --instance-type (instance type) --key-name (keypair name)
```
In AWS site a new instance is created
