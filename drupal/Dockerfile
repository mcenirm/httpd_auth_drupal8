FROM drupal:8.2-apache

RUN curl -sLR -o /usr/bin/drush \
    https://github.com/drush-ops/drush/releases/download/8.1.13/drush.phar && \
    chmod +x /usr/bin/drush

COPY \
    docker-drupal-entrypoint \
    install_cli_for_pdo_drivers \
    wait_for_database \
    /usr/local/bin/

RUN install_cli_for_pdo_drivers

#COPY ./initdrupal.d/* docker-entrypoint-initdrupal.d/

ENTRYPOINT [ "/usr/local/bin/docker-drupal-entrypoint" ]
