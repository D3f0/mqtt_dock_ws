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
logs:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) logs
ps:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) ps

ps_all:
	docker  ps

# Envía unos mensajes persistentes
test_pub:
	mosquitto_pub -h localhost -p 11883 -t messages -m "TEST PAYLOAD `date`" -r


down:
	docker-compose -f $(COMPOSE_FILE) -p$(PROJECT_NAME) down

re: down up
