docker-compose exec web sh -c "exec chmod -R 777 /app"
docker-compose exec web sh -c "exec chown -R www-data:www-data /app"

sudo chown -R $1:$2 app/
sudo chmod -R 755 app/
sudo chmod -R 777 app/wp-content/uploads/
