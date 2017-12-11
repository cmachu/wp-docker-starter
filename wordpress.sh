#!/bin/bash

# TASKS

# wordpress docker start
# wordpress docker stop

# wordpress init

# wordpress db import <filename:optional, default: last exported>
# wordpress db export

# wordpress frontend

# wordpress stack run - docker start, frontend
# wordpress stack stop - docker stop


docker exec lp_landing_1 sh -c "exec wp --allow-root $1 $2 $3 $4 $5"
