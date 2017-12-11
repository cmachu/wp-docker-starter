#!/bin/bash
cd db_dumps
LASTFILE=${4:-$(find -name '*.sql' | sort -V | tail -1)}
SKIP='./'
CLEARFILE=${LASTFILE//$SKIP/}
echo "Importing to database '$3' : db_dumps/$CLEARFILE"

docker-compose exec db sh -c "exec mysql -u $1 -p$2 $3 < /db_dumps/$CLEARFILE"
