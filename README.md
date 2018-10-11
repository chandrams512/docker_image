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
  
  AZURE CLI
  
```

Here the base Os is Ubuntu 16.04 and JAVA version 1.8

Create folder in root and paste dockerfile and  config folder of docker system.
* After local setup and deploy project on Local browser.
  Copy DockerNodeJS project into Docker Config folder with the same Repository Name.
        
* Steps to install Docker Ubuntu System.
  
```
   step 1 - login with Administrator using 
        sudo -i 
        using system password.
   step 2 - goto that folder.
         cd foldername.
   step 3 - build docker using 
       docker build -t node . (paste as it is with dot)
   step 4 - run docker system using
       docker run -i -t -p 127.0.0.1:3000:3000 node:latest
```

After successful creation of container,write these command in container,Go to DockerNodeJs folder


```
npm install

 step 1- service postgresql start.
 step 2- sudo -u postgres psql.
 step 3- ALTER USER postgres PASSWORD 'root';
 step 4- CREATE TABLE scl_user(
        user_id serial PRIMARY KEY,
        username text NOT NULL,
        password text NOT NULL,
        email text NOT NULL,
        mobile_no text NOT NULL,
        created_on date,
        updated_by date,
        last_login date,
        login_attempts integer);
        
 step 5- 'ctrl+d' for exit from postgres database cmd.
 keep database name postgres in all place
```

* Start the node project
```
  npm start
```

* Browse to **http://127.0.0.1:3000**


*For create instance in AWS
in container write

```
 aws configure

```
 After this command fill the value of AWS

```
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
