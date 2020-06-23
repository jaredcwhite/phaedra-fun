#! /usr/bin/env bash

docker build -t phaedra_fun_rack .
docker run -d --env-file=.env -p 8080:8080 -t phaedra_fun_rack