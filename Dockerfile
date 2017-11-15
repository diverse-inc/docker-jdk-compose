FROM openjdk:8-jdk-alpine

ENV DOCKER_VERSION 17.07.0-r0
ENV PYTHON_PIP_VERSION 9.0.1-r1
ENV DOCKER_COMPOSE_VERSION 1.17.1
ENV AWS_EB_CLI_VERSION 3.12.1
ENV GRADLE_VERSION 3.3
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

RUN set -ex \
 && apk add --no-cache \
   --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
   --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
     docker=${DOCKER_VERSION} py-pip=${PYTHON_PIP_VERSION} bash curl \
 && pip install docker-compose==${DOCKER_COMPOSE_VERSION} \
 && pip install awsebcli==${AWS_EB_CLI_VERSION} \
 && mkdir /opt \
 && curl -SLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && rm gradle-${GRADLE_VERSION}-bin.zip \
 && apk del curl

