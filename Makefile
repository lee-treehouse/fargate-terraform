.DEFAULT_GOAL:=build

.PHONY: build
build: 
	docker compose build

.PHONY: build-cli
build-cli: 
	docker compose build dev-cli

.PHONE: cli
cli: build-cli
	docker compose run --rm dev-cli