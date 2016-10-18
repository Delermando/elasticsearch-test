up:
	docker-compose up -d

kill:
	docker-compose kill

rm: kill
	docker-compose rm -f

restart: rm up

dev: up
	docker exec -it python /bin/bash


kibana-up:
	docker-compose -f infra/docker/composer/kibana/kibana.yml up -d

kibana-kill:
	docker-compose -f infra/docker/composer/kibana/kibana.yml kill

kibana-rm: kibana-kill
	docker-compose -f infra/docker/composer/kibana/kibana.yml rm -f

kibana-restart: kibana-rm kibana-up