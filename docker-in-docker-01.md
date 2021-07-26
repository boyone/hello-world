# Docker in Docker

## Package hello-world.war

```sh
mvn package
```

## Copy war to webapps

```sh
cp target/*.war webapps/hello-world.war
```

## Run Docker in Docker

```sh
docker container run -it --rm \
--privileged \
-v "$(pwd):/workspace" \
-v /var/run/docker.sock:/var/run/docker.sock \
-w /workspace \
docker:20.10-dind sh
```

## Create Network

```sh
docker network create gitlab-ci
```

docker pull maven:3.8.1-openjdk-8-slim

## Start Tomcat Container

```sh
docker container run --rm \
--network gitlab-ci \
-v "$(pwd)/conf/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml" \
-v "$(pwd)/webapps:/usr/local/tomcat/webapps" \
-p 8080:8080 -d \
--name tomcat \
tomcat:9.0.50-jdk8-openjdk-slim-buster
```

```shell
docker cp target/hello-world-0.0.1-SNAPSHOT.war tomcat:/usr/local/tomcat/webapps/hello-world.war
docker cp conf/tomcat-users.xml tomcat:/usr/local/tomcat/conf/tomcat-users.xml
```

```sh
docker container run --rm \
--network gitlab-ci \
-v "/Users/boyone/workspaces/sck/summit/app/hello-world/conf/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml" \
-v "/Users/boyone/workspaces/sck/summit/app/hello-world/webapps:/usr/local/tomcat/webapps" \
-p 8080:8080 -d \
--name tomcat \
tomcat:9.0.50-jdk8-openjdk-slim-buster
```

## Robotframework

```sh
docker pull ppodgorsek/robot-framework:3.8.0
```

## Run Test APIs with robotframework-requests

```shell
docker volume create robot

docker container run -v robot:/data --name tmp alpine:3.14 true

docker cp robot-api/*.* tmp:/data

docker container run --rm -v robot:/data  alpine:3.14 ls /data

docker container rm tmp

docker volume rm robot
```

```sh
docker run --rm \
-v "$(pwd)/reports:/opt/robotframework/reports:Z" \
-v "$(pwd)/robot-api:/opt/robotframework/tests:Z" \
ppodgorsek/robot-framework:3.8.0
```

- ROBOT_REPORTS_DIR (default: /opt/robotframework/reports)
- ROBOT_TESTS_DIR (default: /opt/robotframework/tests)

```sh
docker run --rm \
-e ROBOT_REPORTS_DIR:reports \
-e ROBOT_TESTS_DIR:robot-api \
ppodgorsek/robot-framework:3.8.0
```

## Stop and Remove Tomcat Container

```sh
docker container stop tomcat
docker container rm tomcat
```

## Remove Network

```sh
docker network rm gitlab-ci
```

---

## Volume

```shell
docker volume create my_vol

docker container run -v my_vol:/data --name tmp alpine:3.14 true

echo "hello" > hello.txt

docker cp hello.txt tmp:/data

docker container run --rm -v my_vol:/data  alpine:3.14 ls /data

docker container rm tmp

docker volume rm my_vol
```
