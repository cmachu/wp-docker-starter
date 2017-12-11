#!/bin/bash
docker exec wpdockerstarter_web_1 sh -c "exec wp --allow-root $1 $2 $3 $4 $5"
