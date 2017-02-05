NAME = jenkins-slave-jnlp
VERSION ?= latest
REGISTRY ?= eu.gcr.io/techstories-155021

default: build

all: clean build push

build:
	docker build -t ${REGISTRY}/${NAME}:${VERSION} .

clean:
	docker rmi ${REGISTRY}/${NAME}:${VERSION}

push: build
	gcloud docker -- push ${REGISTRY}/${NAME}:${VERSION}

shell: build
	docker run -ti --rm ${REGISTRY}/${NAME}:${VERSION} /bin/sh
