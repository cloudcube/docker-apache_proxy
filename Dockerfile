FROM cloudcube/base

MAINTAINER DavidZhao <zhaohaibin@outlook.com>

ENV REFRESHED_AT 2015-07-07 07:18

RUN apt-get update -y

RUN apt-get install apache2-mpm-prefork -y

RUN apt-get install apache2 curl git -y

RUN a2enmod proxy_http proxy_ajp proxy_balancer rewrite headers

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD config/httpd.conf /etc/supervisor/conf.d/httpd.conf
ADD config/000-default.conf /tmp/000-default.conf
ADD config/default-ssl.conf /tmp/default-ssl.conf

WORKDIR /etc/apache2/sites-available

RUN rm -rf 000-default.conf default-ssl.conf

WORKDIR /root

VOLUME [ "/var/www/html" ]
VOLUME [ "/etc/apache2/sites-available" ]


EXPOSE 80

ADD assets /restart

CMD [ "/restart/restart" ]



