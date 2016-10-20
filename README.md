# Docker Compose: mosquitto, nginx (como server frontera) y Flask

* Nginx recibe y discrimina, manda WS para Mosquitto y HTTP a Flask
* Flask es una aplicación simple
* Mosquitto está configurado para poder recibir conexiones por websocket

## Como usar

- `docker-compose up --build`
- Abrir browser en localhost:8081
- `mosquitto_pub -h localhost -p 11883 -t messages -m "Payload for the webapp" -r`


# Ejemplo sin implementación de autenticación en Flask

```
webapp_1  | 172.22.0.2 - - [20/Oct/2016 01:17:13] "POST /superuser HTTP/1.1" 404 -                     
mqtt_1    | <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">                                    
mqtt_1    | <title>404 Not Found</title>                                                               
mqtt_1    | <h1>Not Found</h1>                                                                         
mqtt_1    | <p>The requested URL was not found on the server.  If you entered the URL manually please c
heck your spelling and try again.</p>                                                                  
mqtt_1    | 1476926233: |-- url=http://webapp:8000/acl                                                 
mqtt_1    | 1476926233: |-- data=domain=NULL&port=NULL&username=anonymous&password=&topic=messages&acc=
2&clientid=mosqpub/926-greybird.lo                                                                     
webapp_1  | 172.22.0.2 - - [20/Oct/2016 01:17:13] "POST /acl HTTP/1.1" 404 -                           
mqtt_1    | 1476926233: |-- aclcheck(anonymous, messages, 2) AUTHORIZED=0 by (null)                    
mqtt_1    | 1476926233: |--  Cached  [EF4597E230774DCC8901214573E1118144131E01] for (mosqpub/926-greybi
rd.lo,anonymous,2)                                                                                     
mqtt_1    | 1476926233: Denied PUBLISH from mosqpub/926-greybird.lo (d0, q0, r1, m0, 'messages', ... (4
1 bytes))                                                                                              
mqtt_1    | 1476926233: Received DISCONNECT from mosqpub/926-greybird.lo                               
mqtt_1    | 1476926233: Client mosqpub/926-greybird.lo disconnected. 
```