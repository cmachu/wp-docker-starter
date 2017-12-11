#!/bin/bash

echo "Start docker... ";
sudo service apache2 stop
docker-compose up
