#!/bin/bash

echo "Start project...";
sudo service apache2 stop

./bin/docker/start-quiet.sh

./bin/frontend.sh $1