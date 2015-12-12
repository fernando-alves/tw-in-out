install:
	./script/start_docker.sh
	docker-compose run app bundle exec rake in_out:setup

run:
	docker-compose run app bundle exec rake in_out:start

test:
	docker-compose run app bundle exec rake spec
