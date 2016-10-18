# Docker Compose: mosquitto, nginx (como server frontera) y Flask

* Nginx recibe y discrimina, manda WS para Mosquitto y HTTP a Flask
* Flask es una aplicación simple
* Mosquitto está configurado para poder recibir conexiones por websocket

## Como usar

- `docker-compose up --build`
- `mosquitto_pub -h localhost -p 11883 -t messages -m "Payload for the webapp" -r`

