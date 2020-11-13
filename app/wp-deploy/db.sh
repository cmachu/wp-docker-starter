#!/bin/bash
echo "USER: $1"
echo "PASS: $2"
echo "HOST: $3"
echo "DB: $4"

mysqldump --add-drop-table --no-data -u "$1" -h "$3" -p"$2" "$4" | grep 'DROP TABLE' >> temp.sql
echo "DB empty!"

mysql -u "$1" -h "$3" -p"$2" "$4" <db-dump.sql
echo "Dump imported!"

echo "Replacing in DB..."
php _srdb/srdb.cli.php -h "$3" -u "$1" -n "$4" -p "$2" -s "example.localhost" -r "example.com"
php _srdb/srdb.cli.php -h "$3" -u "$1" -n "$4" -p "$2" -s "http://" -r "https://"


echo "Done."