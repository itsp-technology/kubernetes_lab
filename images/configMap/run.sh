#!/bin/bash

rm -f /var/www/html/index.html

for var in APP_NAME PROJECT_NAME ENVIRONMENT CLOUD REGION IS_VPC COMPONENT SOFTWARE SOFTWARE_VERSION APP_VERSION; do
  VAR=\$$var
  if [ -z "$(eval echo $VAR)" ]; then
    echo "VARIABLE MISSING :: $var"
    exit 1
  else
    echo "$var = $(eval echo $VAR)" >> /var/www/html/index.html
  fi
done

# Start Apache in foreground mode
apache2ctl -D FOREGROUND
