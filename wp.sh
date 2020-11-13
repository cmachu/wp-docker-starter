#!/bin/bash

BASH_GROUP='root'
BASH_USER='root'

WP_USER='root'
WP_PASS='root'
WP_EMAIL='root@wordpress.localhost'
WP_URL='http://wordpress.localhost/'
WP_TITLE='Sample website'
WP_THEME='twentyseventeen'

DB_NAME='wordpress'
DB_USER='root'
DB_PASS='root'
DB_HOST='db:3306'


case $1 in
    init)
        ./bin/init.sh $BASH_USER $BASH_GROUP $WP_USER $WP_PASS $WP_EMAIL $WP_URL "$WP_TITLE" $DB_NAME $DB_USER $DB_PASS $DB_HOST
        ;;
    frontend)
        ./bin/frontend.sh $WP_THEME
        ;;
    run)
        ./bin/run.sh $WP_THEME
        ;;
    wp-cli)
        ./bin/wp-cli.sh $1 $2 $3 $4 $5
        ;;
    db)
        case $2 in
            import)
                ./bin/db/import.sh $DB_USER $DB_PASS $DB_NAME $3
                ;;
            export)
                ./bin/db/export.sh $DB_USER $DB_PASS $DB_NAME
                ;;
        esac;
        ;;
    docker)
        case $2 in
            start)
                ./bin/docker/start.sh
                ;;
            start-quiet)
                ./bin/docker/start-quiet.sh
                ;;
            privi)
                ./bin/docker/privi.sh $BASH_USER $BASH_GROUP
                ;;
            stop)
                ./bin/docker/stop.sh
                ;;
        esac;
        ;;
esac;
