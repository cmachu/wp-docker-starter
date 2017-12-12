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

## Up and down your project
### Start project

### Stop project


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