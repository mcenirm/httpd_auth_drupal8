FROM centos:7

RUN yum -y makecache fast
RUN yum -y install epel-release centos-release-scl
RUN yum -y makecache fast
RUN yum -y install httpd24 postgresql

COPY entrypoint /

EXPOSE 80

ENTRYPOINT [ "/entrypoint" ]
