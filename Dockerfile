FROM mysql:5.6

ADD https://repo.percona.com/apt/percona-release_0.1-3.jessie_all.deb /
RUN dpkg -i percona-release_0.1-3.jessie_all.deb \
    && apt-get update \
    && apt-get install -y percona-xtrabackup-22

VOLUME ["/migrations"]

ONBUILD COPY migrations /migrations
ONBUILD COPY conf.d /etc/mysql/conf.d
