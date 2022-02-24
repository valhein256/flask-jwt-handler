SERVICE_IMAGE_NAME := valhein256/headers-handler-devenv

docker-image-push:
	@docker tag ${SERVICE_IMAGE_NAME}:latest ${SERVICE_IMAGE_NAME}:latest
	@docker ${SERVICE_IMAGE_NAME}:latest

build:
	@echo "Build jupyter docker iamge..."
	@docker build -f ./service/Dockerfile . \
		-t ${SERVICE_IMAGE_NAME}

launch-service:
	@docker run \
		-v ${PWD}/service:/opt/app \
		-p 5031:80 \
		--rm ${SERVICE_IMAGE_NAME}

service-dev:
	@docker run \
		-v ${PWD}/service:/opt/app \
		--rm -it ${SERVICE_IMAGE_NAME} \
		/bin/bash

service-libs-update:
	@docker run \
		-v ${PWD}/service:/opt/app \
		--rm -it ${SERVICE_IMAGE_NAME} \
		poetry update

# lint and libs-update
lint:
	@docker run \
		-v ${PWD}:/opt/app \
		--rm -it ${SERVICE_IMAGE_NAME} \
		flake8 --ignore=E501

clean-uploads-images:
	@rm -rf ./service/static/uploads/*
