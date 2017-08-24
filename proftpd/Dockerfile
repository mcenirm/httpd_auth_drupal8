FROM centos:7

RUN yum -y makecache fast
RUN yum -y install epel-release
RUN yum -y install proftpd proftpd-utils proftpd-postgresql

COPY proftpd.conf /etc/

COPY setup /tmp/
RUN /tmp/setup

EXPOSE 20 21 11110-11119

ENTRYPOINT /usr/sbin/proftpd --nodaemon
