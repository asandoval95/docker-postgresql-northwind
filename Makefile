DOCKER_REPO := asandoval95
APP_NAME := postgres-northwind
VERSION := 13

all: build tag

.PHONY: version

# DOCKER TASKS
# Build the container
build:
	docker build -t $(DOCKER_REPO)/$(APP_NAME) .

run:
	docker run -it --rm -p 5432:5432 --name postgres-northwind $(DOCKER_REPO)/$(APP_NAME):latest

tag: tag-latest tag-version ## Generate container tags for the `{version}` ans `latest` tags

tag-latest: ## Generate container `{version}` tag
	@echo 'create tag latest'
	docker tag $(DOCKER_REPO)/$(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

tag-version: ## Generate container `latest` tag
	@echo 'create tag $(VERSION)'
	docker tag $(DOCKER_REPO)/$(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)

version: ## Output the current version
	@echo $(VERSION)