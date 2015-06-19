FROM ubuntu:12.04

MAINTAINER Victor Ursu version: 0.1

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y memcached
RUN apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV MEMCACHED_MEMORY_LIMIT 128

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

RUN mkdir -p /root/.ssh
RUN cp /var/my-app/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN git clone git@github.com:pfizer/platforms.git


VOLUME ["/var/www"]
