#!/bin/bash
NOW=$(date +"%d%m%Y-%H%M")
TIMESTAMP=$(date +%s)
DUMPFILE="$TIMESTAMP-autodump-$NOW.sql"
echo "Exporting to file: $DUMPFILE"
docker exec lp_db_1 sh -c 'exec mysqldump -u root -proot wordpress' > db_dumps/$DUMPFILE