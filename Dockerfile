FROM jwilder/docker-gen

COPY ./templates/nginx.tmpl /etc/docker-gen/templates/nginx.tmpl

RUN mkdir -p /etc/nginx/conf.d/
RUN { \
      echo 'proxy_connect_timeout 10m;'; \
      echo 'proxy_send_timeout 10m;'; \
      echo 'proxy_read_timeout 10m;'; \
      echo 'send_timeout 10m;'; \
      echo 'client_max_body_size 100m;'; \
    } > /etc/nginx/conf.d/extended_timeouts.conf