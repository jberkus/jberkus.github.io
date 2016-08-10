FROM fedora:24

MAINTAINER josh@agliodbs.com

RUN dnf -y install python

ADD . /srv/

WORKDIR /srv/

EXPOSE 8000

CMD ["/usr/bin/python","-m","SimpleHTTPServer"]
