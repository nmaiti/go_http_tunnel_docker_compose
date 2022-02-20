#!/bin/bash

###################################################################
# Script Name : create_valid_clients.sh
#
# Description : Create 
#
# Args :
#
# Creation Date : 20-02-22 20:14:36
# Last Modified : 20-02-22 20:18:27S
#
# Created By :
# Email : nbmaiti83@gmail.com
###################################################################

docker run -v ${PWD}/docker-compose_client_run/certs:/certs -v /home/nabendu/PLAYGROUND/WIP/go_http_tunnel_docker/docker-compose_client_run/config:/config nbmaiti/go-tunnel /usr/bin/tunnel -config /config/tunnels.yml id >> ./docker-compose_server_run/config/ValidClients.txt
