PROJECT_NAME=mqtt
COMPOSE_FILE=compose/docker-compose.yml

all: up

build:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build
up:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up --build
stop:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) stop
kill:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) kill
ps:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) ps

ps_all:
	docker  ps


down:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) down

re: down up
