#!/bin/bash
docker exec lp_landing_1 sh -c "exec wp --allow-root $1 $2 $3 $4 $5"
