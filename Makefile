DOCKER_REPO_NAME = "stefanwalther"
DOCKER_IMAGE_NAME = "circleci-test-tags"

help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

gen-readme:							## Generate README.md (using docker-verb)
	docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
.PHONY: gen-readme

build:								## Build the docker image (prod)
	NODE_VER=$(NODE_VER)
	docker build -t $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME) -f Dockerfile .
.PHONY: build
