#!/bin/bash
cd db_dumps
LASTFILE=${1:-$(find -name '*.sql' | sort -V | tail -1)}
echo "Importing: db_dumps/$LASTFILE"
docker exec lp_db_1 sh -c "exec mysql -u root -proot wordpress < /db_dumps/$LASTFILE"
