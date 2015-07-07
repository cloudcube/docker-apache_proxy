FROM cloudcube/base

MAINTAINER DavidZhao <zhaohaibin@outlook.com>

ENV REFRESHED_AT 2015-07-07 07:18

RUN apt-get update -y

RUN apt-get install apache2 curl -y

RUN a2enmod proxy_http proxy_ajp proxy_balancer rewrite headers

RUN a2dismod mpm_event && a2enmod mpm_prefork

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf




