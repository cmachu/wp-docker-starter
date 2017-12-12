#!/bin/bash

echo "Install Wordpress...";

sudo chown -R $1:$2 app/
sudo chmod -R 755 app/

sudo service apache2 stop
docker-compose up -d

docker-compose exec db sh -c "exec mysql -u $9 -p${10} -e 'DROP DATABASE $8'";
docker-compose exec db sh -c "exec mysql -u $9 -p${10} -e 'CREATE DATABASE $8'";

docker-compose exec web sh -c "exec wp --allow-root core download";
docker-compose exec web sh -c "exec wp --allow-root config create --dbname=$8 --dbuser=$9 --dbpass=${10} --dbhost=${11}";
docker-compose exec web sh -c "exec wp --allow-root core multisite-install --admin_user=$3 --admin_password=$4 --admin_email=$5 --url=$6 --title='$7'";


docker-compose exec web sh -c "exec mkdir /app/wp-content/uploads"
docker-compose exec web sh -c "exec chmod -R 777 /app"
docker-compose exec web sh -c "exec chown -R www-data:www-data /app"

sudo chown -R $1:$2 app/


