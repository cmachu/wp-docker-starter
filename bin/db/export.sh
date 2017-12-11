#!/bin/bash
NOW=$(date +"%d%m%Y-%H%M")
TIMESTAMP=$(date +%s)
DUMPFILE="$TIMESTAMP-autodump-$NOW.sql"
echo "Exporting '$3' database to file: db_dumps/$DUMPFILE"
docker-compose exec db sh -c "exec mysqldump -q -u $1 -p$2 --databases $3 > db_dumps/$DUMPFILE"
