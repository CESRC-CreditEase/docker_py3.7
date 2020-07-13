FROM centos:7
RUN yum update -y
RUN yum install epel-release \
        wget gcc make zlib-devel libffi-devel bind-utils \
        openssl-devel openldap-devel crontabs.noarch -y

ADD Python-3.7.4.tgz .
RUN cd Python-3.7.4 \
    && ./configure --with-ssl \
    && make && make install \
    && make clean

RUN mv /usr/bin/python /usr/bin/python.bak \
    && ln -s /usr/local/bin/python3 /usr/bin/python \
    && ln -s /usr/local/bin/pip3 /usr/bin/pip \
    && sed -i "s#/usr/bin/python#/usr/bin/python2#" /usr/bin/yum \
    && sed -i "s#/usr/bin/python#/usr/bin/python2#" /usr/libexec/urlgrabber-ext-down


