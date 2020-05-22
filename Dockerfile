FROM centos:7
RUN yum update -y
RUN yum install -y epel-release wget gcc make zlib-devel libffi-devel bind-utils openssl-devel

ADD Python-3.7.4.tgz .
RUN cd Python-3.7.4 && ./configure --with-ssl && make && make install

RUN yum install openldap-devel -y
RUN yum install supervisor crontabs.noarch -y

