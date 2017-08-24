FROM centos:7

RUN yum -y makecache fast
RUN yum -y install epel-release
RUN yum -y install proftpd proftpd-utils proftpd-postgresql
RUN yum -y install postgresql

COPY proftpd.conf /etc/

COPY entrypoint /

EXPOSE 20 21 11110-11119

ENTRYPOINT [ "/entrypoint" ]
