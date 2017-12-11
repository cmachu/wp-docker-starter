#!/bin/bash

# Available TASKS

# wordpress docker start
# wordpress docker stop

# wordpress db import <filename:optional, default: last exported>
# wordpress db export

# wordpress init
# wordpress frontend
# wordpress run

BASH_GROUP='pawel'
BASH_USER='pawel'

WP_USER='root'
WP_PASS='root'
WP_URL='htt://landing.localhost/'
WP_EMAIL='root@root.com'
WP_TITLE='Sample website'
WP_THEME='test-theme'

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
            stop)
                ./bin/docker/stop.sh
                ;;
        esac;
        ;;
esac;