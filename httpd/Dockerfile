FROM centos/httpd-24-centos7

ENV PGHOST="postgres" \
    PGPORT="5432" \
    PGDATABASE="postgres" \
    PGUSER="postgres" \
    PGPASSWORD="postgres"

COPY test.conf ${HTTPD_MAIN_CONF_D_PATH}/
COPY setup_teams ${HTTPD_APP_ROOT}/

USER 0
RUN yum -y install apr-util-pgsql
RUN ${HTTPD_APP_ROOT}/setup_teams
USER 1001
