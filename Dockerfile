FROM nginx:1.10

RUN apt-get clean && apt-get update && apt-get install -y nano spawn-fcgi fcgiwrap wget curl

RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap

RUN chown nginx:nginx /etc/init.d/fcgiwrap

COPY ./vhost.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www

COPY ./html/ .

COPY run.sh /

RUN chmod a+x /run.sh

RUN chmod a+x *.pl

RUN ls -lths

CMD ["/run.sh"]