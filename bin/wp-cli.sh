#!/bin/bash
docker-compose exec web sh -c"exec wp --allow-root $1 $2 $3 $4 $5"
