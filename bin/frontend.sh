#!/bin/bash

docker-compose exec web sh -c "/app/wp-deploy/frontend.sh $1"
