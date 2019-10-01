.PHONY: all help build-context build-image build

RHEL_VER =$(shell ./get_rhel_version.sh)

all: help

help:   ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build-image:
	# Build Docker image
	tar cf - /etc/yum.repos.d /etc/pki /etc/rhsm Dockerfile | docker build --build-arg RHEL_VER=$(RHEL_VER) -t rhel:$(RHEL_VER)-entitled -

build:  ## Create build context and build a base image with the subscription injected
build: build-image

