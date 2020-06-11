#! /usr/bin/env bash

docker build -t phaedra_fun_rack .
docker run -p 8080:8080 -t phaedra_fun_rack