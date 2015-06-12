FROM ubuntu:12.04

MAINTAINER Victor Ursu version: 0.1

# PROGRAMS
RUN apt-get update -y
RUN apt-get install -y apache2
RUN apt-get install -y libapache2-mod-auth-mysql php5-mysql
RUN apt-get install -y python-markdown
RUN apt-get install -y git-core vim zsh
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y strace
RUN apt-get install -y diffstat
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump
RUN apt-get install -y screen
RUN apt-get install -y nano
RUN apt-get update \
 && apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

VOLUME ["/var/www"]