FROM ubuntu:18.04 

MAINTAINER Gauthier Malfait version: 0.3 

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/* 

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_LOCK_DIR /var/lock/ 
ENV APACHE_PID_FILE /run/apache2.pid 

EXPOSE 80 

COPY . /var/www/html/ 

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"] 

