image_name     := kafka-manager
image_registry := samklr
gitref         := master
image_version  := 1.3.3.18


.PHONY: build tag push

build:
	docker build \
		--build-arg "http_proxy=$(http_proxy)" \
		--build-arg "https_proxy=$(https_proxy)" \
		--tag $(image_name) .

tag: build
	docker tag $(image_name) $(image_registry)/$(image_name):latest
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_version)

push: tag
	docker push $(image_registry)/$(image_name):latest
	docker push $(image_registry)/$(image_name):$(image_version)
