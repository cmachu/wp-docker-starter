# Wordpress Docker Starter
Lightweight boilerplate for Wordpress projects based on Docker.

This boilerplate gives you ability to setup fresh Wordpress instance with 10 seconds of configuration.

Build in tools helps you to track and manage database dumps - so important in Wordpress development.

You can also work with your Wordpress using WP-CLi and automated front-end runner(npm, Bower, Grunt, Gulp, Webpack, Composer) for your theme.

All features of this boilerplate can be accessible from command line.

## Quick start
1. Clone this repository: `git clone https://github.com/cmachu/wp-docker-starter.git`
2. Setup your configuration on `wp.sh` and `docker-compose.yml` files. More details you can find below, on `Setup section`
3. Install your Wordpress using `./wp.sh init` command on your terminal
4. Run your project using `./wp.sh run` command on your terminal

## Default configuration
- By default, you can find your Wordpress project on `http://wordpress.localhost/`.
- You can login into Wordpress admin panel using `root/root` login and password on page `http://wordpress.localhost/wp-admin`
- You can access PhpMyAdmin on URL `http://phpmyadmin.localhost/` and login into using `root/root` user and password.
- `./wp.sh init` command will create `wordpress` database by default.
- By default, project is configured for multisite - you can access sub pages on subdomains, example `http://example.wordpress.localhost`. No extra pages on multisite are configured by default.
- Front-end processor has disabled all features by default. You need to configure `/bin/frontend.sh` for your project. You can add every front-end(npm, Webpack, Bower, Gulp, Grunt) and back-end(Composer) tool into this script.

## Setup
Before first init run and Wordpress instalation, you need to provide project details in two files - `wp.sh` and `docker-compose.yml`.
1. On file `docker-compose.yml` you need configure
- Your project URL - By default there is `VIRTUAL_HOST=wordpress.localhost,*.wordpress.localhost`.
- PhpMyAdmin URL - By default there is `VIRTUAL_HOST=phpmyadmin.localhost`.
- MySQL database credentials, for default there is `MYSQL_ROOT_PASSWORD: root`.
- You can configure every container according to specified container documentation.

2. On file `wp.sh`, you need provide variables described below:
- `BASH_GROUP='pawel'` - Your linux workgroup.
- `BASH_USER='pawel'` - Your linux user - these variables are needed for chown commands after project init.

- `WP_USER='root'` - Wordpress admin username.
- `WP_PASS='root'` - Wordpress admin password.
- `WP_EMAIL='root@wordpress.localhost'` - Wordpress admin e-mail
- `WP_URL='http://wordpress.localhost/'` - Wordpress project url - must be the same as `VIRTUAL_HOST=wordpress.localhost`.
- `WP_TITLE='Sample website'` - Wordpress project title
- `WP_THEME='twentyseventeen'` - Wordpress theme name - for fronted automated tools and watchers.

- `DB_NAME='wordpress'` - Database name for Wordpress installation.
- `DB_USER='root'` - Database user - must be the same as on Evnvironments variables on `docker-compose.yml`
- `DB_PASS='root'` - Database password - must be the same as on Evnvironments variables on `docker-compose.yml`
- `DB_HOST='db:3306'` - Database user - must be the same as container name and port on `docker-compose.yml`

## Start and Stop project
#### You can start your Wordpress project by few ways:
- You can run full-stack runner(Docker + front-end tools + watchers) using `./wp.sh run` command on your terminal. Please remember to add valid theme folder on `wp.sh` config area, and to setup valid front-end workflow on `/bin/frontend.sh`.
- You can run Docker containers using `./wp.sh docker start`
- You can run only front-end tools and watchers using `./wp.sh frontend`
- When your Docker containers are running, you can import last database dump using `./wp.sh db import` command on terminal.

#### Stop project
- You can export your database using `./wordpress db export` command. File will be automatically saved on `db_dumps` directory and prepared for import.
- When Dockers containers run on background, you can stop them using `./wp.sh docker stop` command on terminal.


## Proposed Workflow
Our boilerplate determine some kind of workflow. Projects using this boilerplate and specified workflow could be contributed by few devs.

1. Setup project using './wp.sh init', fill all necessary details.
2. Install, activate, work on your theme and plugins.
3. Create db dump using `./wp.sh db export`.
4. Add all files with 'db_dump' folder to repository.

1. You can pull your project from repository.
2. Run your Docker containers and if you want front-end preproccessors using `./wp.sh run`
3. You can import your last database dump using `./wp.sh db import`

## Available tasks

- `./wp.sh docker start` - Start Docker containers
- `./wp.sh docker stop` - Stop all Docker containers
- `./wp.sh docker privi` - Re-attach chmods and ownership inside docker and system for Wordpress.

- `./wp.sh db import <filename:optional - default: last exported file>` - Import database dump from last exported file or from specified file name. Database dumps are located on `db_dumps` directory.
- `./wp.sh db export` - Export database

- `./wp.sh init` - Install Wordpress, create dabase, config and tie together.
- `./wp.sh frontend` - Run front-end and backend tools.
- `./wp.sh run` - Run project.
- `./wp.sh wp-cli <wp-cli commands>` - Use WP-CLI inside Docker container.

