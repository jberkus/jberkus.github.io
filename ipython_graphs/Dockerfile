FROM fedora:25
MAINTAINER Josh Berkus <josh@berkus.org>

RUN dnf -y --setopt=tsflags=nodocs install postgresql-server python2-psycopg2 postgresql-plpython postgis  \
    && dnf -y --setopt=tsflags=nodocs install ipython-notebook python2-matplotlib python2-scipy \
    && dnf clean all \
    && pip install matplotlib_venn

ADD . /notebook

RUN chmod 777 /notebook \
   && su - postgres -c "/notebook/pgsetup" \
   && /notebook/nbsetup

CMD ["/notebook/nbstart"]
