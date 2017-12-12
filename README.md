# Wordpress Docker Starter
Lightweight boilerplate for Wordpress projects based on Docker.

This boilerplate gives you ability to setup fresh Wordpress instance with 10 seconds of configuration.

Build in tools helps you to track and manage database dumps - so important in Wordpress development.

You can also work with your Wordpress using WP-CLi and automated front-end runner(npm, Bower, Grunt, Gulp, Webpack, Composer) for your theme.

## Quick start
1. Clone this repository: `git clone https://github.com/cmachu/wp-docker-starter.git`
2. Setup your configuration on `wordpress.sh` and `docker-compose.yml` files. More details you can find below, on `Setup section`
3. Install your Wordpress using `./wordpress.sh init` command on your terminal
4. Run your project using `./wordpress.sh run` command on your terminal

## Default configuration
- By default, you can find your Wordpress project on `http://wordpress.localhost/`.
- You can login into Wordpress admin panel using `root/root` login and password on page `http://wordpress.localhost/wp-admin`
- You can access PhpMyAdmin on URL `http://phpmyadmin.localhost/` and login into using `root/root` user and password.
- By default, project is configured for multisite - you can access sub pages on subdomains, example `http://example.wordpress.localhost`. No extra pages on multisite are configured by default.
- Front-end processor has disabled all features by default. You need to configure `/bin/frontend.sh` for your project. You can add every front-end(npm, Webpack, Bower, Gulp, Grunt) and back-end(Composer) tool - to this script.

## Setup

## Up and down your project to live
### Start project
You can start your Wordpress project by few ways:
- You can run full-stack runner(Docker + front-end tools + watchers) using `./wordpress.sh run` command on your terminal. Please remember to add valid theme folder on `wordpress.sh` config area, and to setup valid front-end workflow on `/bin/frontend.sh`.
- You can run Docker containers using `./wordpress.sh docker start`
- You can run only front-end tools and watchers using `./wordpress.sh frontend`

### Stop project
- When Dockers containers run on background, you can stop them using `./wordpress.sh docker stop` command on terminal.


## Setup

## Proposed Workflow

## Available tasks

- ./wordpress.sh docker start
- ./wordpress.sh docker stop

- ./wordpress.sh db import <filename:optional - default: last exported file>
- ./wordpress.sh db export

- ./wordpress.sh init
- ./wordpress.sh frontend
- ./wordpress.sh run
- ./wordpress.sh wp-cli <wp-cli commands>