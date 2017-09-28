.PHONY: all build build-context

all:	## Creates build context and Docker image
all: build

help:	## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build-context:
	# Create build context
	cp -r /etc/yum.repos.d .
	cp -r /etc/pki .
	cp -r /etc/rhsm .
	cp -r /var/lib/rpm .
	# Remove Docker repos, if found
	rm -f yum.repos.d/docker-*.repo
	rm -f yum.repos.d/packages.docker.com_*.repo

build-image:
	# Build Docker image
	docker build -t rhel:7.3-entitled .

build:	## Create build context and build a base image with the subscription injected
build: build-context build-image

