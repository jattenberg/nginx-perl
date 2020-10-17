FROM nginx:1.10

RUN apt-get clean && apt-get update && apt-get install -y nano spawn-fcgi fcgiwrap wget curl

RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap

RUN chown nginx:nginx /etc/init.d/fcgiwrap

COPY ./vhost.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www

COPY ./html/ .

RUN chmod a+x *.pl

CMD /etc/init.d/fcgiwrap start \
    && nginx -g 'daemon off;'