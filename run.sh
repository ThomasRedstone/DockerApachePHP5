#!/bin/bash

mkdir -p app/cache app/logs
touch app/logs/prod.log
chgrp -R www-data .
chmod -R g+w app/cache app/logs

source /etc/apache2/envvars

service apache2 stop

tail -F /var/log/apache2/* app/logs/prod.log &
exec apache2 -D FOREGROUND

