#!/bin/bash

cd app/wp-content/themes/mokka

echo "Install composer..."
composer install

echo "Install npm...";
npm install

echo "Bower install...";
bower install

echo "Grunt watch... ";
grunt watch
