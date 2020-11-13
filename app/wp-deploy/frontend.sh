#!/bin/bash

cd /app/wp-content/themes/$1

#echo "Install npm...";
npm install

#echo "Bower install...";
bower install --allow-root

#echo "Gulp watch... ";
gulp docker
