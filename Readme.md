## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Folder Structure](#folder)
- [Development ](#development)

  - [App Architecture](#app-archi)
  - [API Architecture Explained](#app-exp)
  - [Running the API](#app-run)

- [Deployment ](#deployment)
  - [Deployment Architecture](#dep-archi)
  - [Deployment Architecture Explained](#dep-exp)
  - [Docker](#docker)
  - [Kubernetes GKE](#k8s)
- [Built Using](#built_using)
- [Author](#authors)

## 🧐 About <a name = "about"></a>

- This graphql api is connected to Postgres database to retrieve data, a challenge from [heyday](https://www.heydaypeople.com/) to join the team as backend Engineer

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live  Kubernetes system.

### Prerequisites

You need to install the fellowing software in order to get the application up and running :

- Node.js and npm.
- NestJS.
- Postgres database. 
- Docker.
- Kubernetes on cloud.


# Development <a name = "development"></a>

## APP Architecture <a name = "app-archi"></a>

- ![Alt text](./images/app-archi.png?raw=true "Title") 

### APP Architecture Explained <a name = "app-exp"></a>

The application architecture contain 2 part

- Simple  GraphQl API  that connect to Postgres  database with define tables  using TypeORM  as interface to retrieve information 


### Installing

- Download and Install node.js and NPM from https://nodejs.org/en/download/ 

### Running the Nest.JS application <a name = "app-run"></a>

- Download or clone the project code from https://github.com/abdm64/heyday-challenge

- install NestJs Framework from the npm cli  for more information please visit [NestJS Web site](https://nestjs.com/) 

- Install all required npm packages by running npm install from the command line in the api  directory  (where the package.json is located).

```
cd api
```

```
npm install
```

- Before start the application you should change the  keys in the api/src/config directory (host, user, password and db name ) in order to connect to the postgres  database.

- Start the application by running npm start from the command line in the api directory , you should see the message:  "Nest application successfully started".


```
npm start
```

- Now you have   graphQl api that connected to the database and you can make query ( please see the attached  email ).  

# 🚀 Deployment <a name = "deployment"></a>

### Prerequisites

- In order to deploy this application in production we need :
  - Docker to build image for this application and push it to the docker hub or private registry .
  - Kubernetes cluster to run the application in production mode from the image that was created .

## Docker <a name = "docker"></a>

### Installing

- Download and install docker on your machine Please Visit [Docker](https://www.docker.com/) 

### Build Docker image

- Build your own docker image and push it to your repo by running "docker build -t my-app-name:v1 . "
  from the command line in api directory

```
cd api
```

```
docker build -t my-app-name:v1 .
```

you need to push the image to [Docker hub](https://hub.docker.com) or your own private  registry .

### Run Docker image

- Run your Docker image for the application by the command line

```
docker run -e [inject your env variable here] my-app-name:v1

```
PS: you need to run the docker image and attached it to a  running Postgres image 

### Docker compose

- Also you can run the application  connected to a database as service by running with pg admin to manage the Postgres database  at port 5050 you can change it in docker-compose  file 

```
docker-compose up
```

and the docker-compose.yaml handle all the task for you running the application with a  database attached 

- to drop the running container use the command

```
docker-compose  down
```

## Kubernetes <a name = "k8s"></a>

## Deployment Architecture <a name = "dep-archi"></a>

- ![Alt text](./images/heyday-dep-archi.png?raw=true "Title")

## Deployment Architecture Explained <a name = "dep-exp"></a>

- Please fellow the instruction in the app-dep.yaml file in the k8s folder to update all information needed ( env var ) in order to the application work on Kubernetes cluster

- create secret in the same namespace to store your pg password by running the Cammand 

```
kubectl create secret generic <secret_name>  --from-literal  PGPASSWORD=<your password>
```

- To run the application on Kubernetes cluster  just run the fellowing command

```
kubectl apply -f k8s

```

 this will create the fellowing  Kubernetes objects:

  - Namespace a virtual cluster for all your resource related to this application ( pods services secret)
  - Deployment for the application with one pod ( running container) insuring high availability for that service. 
  - Deployment for the Postgres database in one pod  ( not the perfect solution for stateful application )
  - PVC to store the data from the database 
  - Cluster ip service that connected to the pod .
  - ingress service that connect the cluster ip service with ingress-nginx load balancer to expose it outside (Public) .

 PS : you must install NGINX Ingress Controller on your k8s cluster before applying the final deployment please check this link https://kubernetes.github.io/ingress-nginx/deploy/ for more information. 

- to drop the application just run the command :

```
kubectl delete  -f k8s

```
this will delete all kubernetes objects

## ⛏️ Built Using <a name = "built_using"></a>


- [NestJS](https://nestjs.com/) - A progressive Node.js framework.
- [Postgres ](https://www.postgresql.org/) - Open source relationel database.
- [TypeORM](https://typeorm.io/#/) - promise-based Node.js ORM for Postgres, MySQL, MariaDB, SQLite and Microsoft SQL Server.
- [GraphQL](https://graphql.org/) query language for APIs.
- [Docker](https://www.docker.com/) - Software platform for building and packaging applications.
- [Kubernetes](https://kubernetes.io/) - Container Orchestration.


## ✍️ Author <a name = "authors"></a>

- [@abdm64](https://github.com/abdm64) Backend | DevOps Engineer @ [Djezzy](http://www.djezzy.dz/)

Made with ❤️   by Abdellah
