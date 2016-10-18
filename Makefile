up:
	docker-compose up -d

kill:
	docker-compose kill

rm: kill
	docker-compose rm -f

dev: up
	docker exec -it python /bin/bash