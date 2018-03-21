FROM nginx:1.13.9

RUN chmod g+w /var/cache/nginx \
	&& sed -i -e '/listen/!b' -e '/80;/!b' -e 's/80;/8080;/' /etc/nginx/conf.d/default.conf \
	&& sed -i -e '/user/!b' -e '/nginx/!b' -e '/nginx/d' /etc/nginx/nginx.conf \
    && sed -i 's!/var/run/nginx.pid!/var/cache/nginx/nginx.pid!g' /etc/nginx/nginx.conf

EXPOSE 8080
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGTERM
USER 1001

ENV APP_DIR /usr/share/nginx/html
COPY build/es5-bundled/ ${APP_DIR}
