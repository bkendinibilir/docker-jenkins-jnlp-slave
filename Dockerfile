FROM openjdk:8-jdk-alpine
LABEL maintainer "Benjamin Kendinibilir <bkendinibilir@mac.com>"

ENV REMOTING_VERSION 2.7
ENV USER jenkins
ENV HOME /home/jenkins

RUN addgroup -g 10000 $USER
RUN adduser -D -h $HOME -u 10000 -G $USER -s /bin/sh $USER

COPY scripts/jenkins-jnlp-slave /usr/local/bin/
RUN chmod 755 /usr/local/bin/jenkins-jnlp-slave

RUN set -x \
    && apk upgrade --update \
    && apk add --no-cache curl \
    && apk add --no-cache make git

USER $USER
WORKDIR /home/$USER

ENTRYPOINT ["jenkins-jnlp-slave"]
