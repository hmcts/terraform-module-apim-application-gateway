#!/usr/bin/env bash
#grabing the public root CA 
curl https://letsencrypt.org/certs/isrgrootx1.pem >root.pem
#grabing the public intermediate CA
curl https://letsencrypt.org/certs/lets-encrypt-r3.pem >intermediate.pem
pwd
ls
cat root.pem intermediate.pem > merged.pem
ls
pwd