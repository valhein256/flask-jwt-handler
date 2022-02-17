SERVICE_IMAGE_TAG := service-devenv

build:
	@echo "Build jupyter docker iamge..."
	@docker build -f ./service/Dockerfile . \
		-t ${SERVICE_IMAGE_TAG}

launch-service:
	@docker run \
		-v ${PWD}/service:/opt/app \
		-p 5031:5031 \
		--rm ${SERVICE_IMAGE_TAG}

service-dev:
	@docker run \
		-v ${PWD}/service:/opt/app \
		--rm -it ${SERVICE_IMAGE_TAG} \
		/bin/bash

service-libs-update:
	@docker run \
		-v ${PWD}/service:/opt/app \
		--rm -it ${SERVICE_IMAGE_TAG} \
		poetry update

# lint and libs-update
lint:
	@docker run \
		-v ${PWD}:/opt/app \
		--rm -it ${SERVICE_IMAGE_TAG} \
		flake8 --ignore=E501

clean-uploads-images:
	@rm -rf ./service/static/uploads/*
