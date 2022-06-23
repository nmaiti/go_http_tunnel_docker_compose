[![Docker Image CI](https://github.com/nmaiti/go_http_tunnel_docker_compose/actions/workflows/main.yml/badge.svg)](https://github.com/nmaiti/go_http_tunnel_docker_compose/actions/workflows/main.yml)

This docker build and docker-compose of go-http-tunnel reverese proxy.
Using it we can tunnel any local service like http server, https server or forwad local ssh service accessible from anywhere from internet. 

# Documentation
Documentation at https://github.com/nmaiti/go-http-tunnel
Origin : mmatczuk/go-http-tunnel server



# Generate Server CA, server, clients certificates
- Generate your certificates 
```
     $ ./generateCertificates.sh YOUR-CA-NAME hostname-of-your-tunnel-server,clientname1,clientname2 
```
    - You can always come back and generate additional client certificates..


## Client

- Copy the client certificate,key, ca certificates to `./docker-compose_client_run/certs/`. Name them `ca.crt`, `server.crt` and `server.key`
- Modify  `./docker-compose_client_run/config/tunnel.yml` (See example `tunnel.yml`)
- `docker run -v ${PWD}/docker-compose_client_run/certs:/certs -v /home/nabendu/PLAYGROUND/WIP/go_http_tunnel_docker/docker-compose_client_run/config:/config nbmaiti/go-tunnel /usr/bin/tunnel -config /config/tunnels.yml id` to show your client id, you have to add this one to the allowed clients (`/etc/tunneld/clients`) on the server 
 Alternatively can run './create_valid_clients.sh' to add clied id to client list
- Now 
```
    $ cd docker-compose_client_run 
    $ docker-compose up 
```
## Server

- Copy the server certificate, server key and ca certificate to `/docker-compose_server_run/certs/`. Name them `ca.crt`, `server.crt` and `server.key`

- now can run server on your vps or cloud aws/gcloud 
```
       $ cd docker-compose_server_run
       $ docker-compose up
```


## NOTE 
Use/modify in `config/check_clients.sh` to provide check if the clinent(certificate id) to be checked from file or database.

Use following ports for access or redirect through proxy (caddy/nginx etc)
- '80 and 443' are default http and https ports respectively
- Default tunneld server port address is 4343
- ssh tunnel remote port is changed to 1025
- SNI address 3000



