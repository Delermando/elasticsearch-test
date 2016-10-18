up:
	docker-compose up -d

kill:
	docker-compose kill

rm: kill
	docker-compose rm -f

dev: up
	docker exec -it python /bin/bash

kibana:
	docker run --name kibana -e ELASTICSEARCH_URL=http://172.17.0.1:9200 -p 5601:5601 -d kibana