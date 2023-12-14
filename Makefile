.PHONY: build run deploy


build:
	$(MAKE) -C frontend/svelte-site bootstrap
	$(MAKE) -C frontend/svelte-site build

run:
	docker-compose build
	docker-compose up

deploy:
	docker-compose build
	docker-compose up -d 