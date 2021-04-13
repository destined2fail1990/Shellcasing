#!/bin/bash

# Author: Jared Weisinger
# Description: Spawn a NoVNC process that contains a static HTML5 front-end, a websocket 'proxy' backend, with rotating encryption. 

# Disclaimer: This probably doesn't work. Search engines are acting strange for me. Can't get the right combo for openssl... health problems don't help either.

RND=$RANDOM
mkdir "/srv/novncsessions/$1_$RND/"
mkdir "/srv/novnc/sessions/$1_$RND/cert/"
P=/srv/novnc/sessions/$1_$RND/cert
openssl req -newkey rsa:4096 -keyout $P/domain.key -x509 -days 3 -out $P/domain.key -nodes \
-subj "/C=US/ST=California/L=Los Angel/O=Galaxy Security/OU=Engineering/CN=remote._________.us"

novnc --listen $1 --vnc $2:6000 --cert $P/domain.crt
