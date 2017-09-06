.PHONY: doc build run default test

VERSION ?= x.y

TEST_IMAGE_NAME := container-images-tests

default: run

doc:
	cd $(VERSION)/$(TARGET) && make doc VERSION=$(VERSION)

build:
	cd $(VERSION)/$(TARGET) && make build VERSION=$(VERSION)

run:
	cd $(VERSION)/$(TARGET) && make run VERSION=$(VERSION)

test:
	cd $(VERSION)/$(TARGET) && make test VERSION=$(VERSION)

test-in-container: test-container
	docker run --rm -ti -e VERSION=$(VERSION) -v /var/run/docker.sock:/var/run/docker.sock:Z -v ${PWD}:/src $(TEST_IMAGE_NAME)

test-container:
	docker build --tag=$(TEST_IMAGE_NAME) -f ./Dockerfile.tests .

all:
	cd x.y && make build VERSION=x.y
	cd x.z && make build VERSION=x.z
