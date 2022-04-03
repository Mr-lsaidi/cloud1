#!/bin/sh

sed -i "s/<<IP>>/https:\/\/$1/g" /home/ubuntu/dockerfiles/mariadb/db.sql