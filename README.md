 
# Flask App with MySQL Docker Setup

This is a simple Flask app that interacts with a MySQL database. The app allows users to submit messages, which are then stored in the database and displayed on the frontend.

## Prerequisites

Before you begin, make sure you have the following installed:

- Docker
- Git (optional, for cloning the repository)

## Setup

1. Clone this repository (if you haven't already):

   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```

2. Navigate to the project directory:

   ```bash
   cd your-repo-name
   ```

3. Create a `.env` file in the project directory to store your MySQL environment variables:

   ```bash
   touch .env
   ```

4. Open the `.env` file and add your MySQL configuration:

   ```
   MYSQL_HOST=mysql
   MYSQL_USER=your_username
   MYSQL_PASSWORD=your_password
   MYSQL_DB=your_database
   ```

## To run this two-tier application using  without docker-compose

- First create a docker image from Dockerfile
```bash
docker build -t flaskapp .
```
docker tag
docker push

i) MySQL Database container on one machine in Private Subnet
```bash
docker run -d \
    --name mysql \
    -v mysql-data:/var/lib/mysql \
    -e MYSQL_DATABASE=mydb \
    -e MYSQL_ROOT_PASSWORD=admin \
    -p 3306:3306 \
    mysql:5.7
```
ii) Frontend container on one machine in Public Subnet
```bash
docker run -d \
    --name flaskapp \
    -e MYSQL_HOST=mysql \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=admin \
    -e MYSQL_DB=mydb \
    -p 5000:5000 \
    flaskapp:latest
```

1. new aws account
2. create a vpc - 2 subnet public and private, igw, NAT (conditional) (nat will cost you money) (delete it as soon as download completes) (ami that has docker and mysql image already installed)
3. 2 ec2 instance - 1 public and 1 private (use ami to start the ec2 in private)
4. make a script.sh which install docker 
4. sg ingress rule - ec2
5. ssh into both - run the script.sh file in both ... ( if private is giving errors like repo not found - )
6. ssh into private ec2 - run the mysql container
7. ssh into public ec2 - run flaskapp and use private ip of ec2 instance in private subnet as mysql host ... error if mysql host is not connected properly 
(install mysql-client and test the connection by running mysql -h <host> -u <username> -p )
8. open the public ip of public ec2 ... test by writing the data

1. do everything using tf
2. jenkinsfile