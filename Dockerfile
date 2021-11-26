FROM nginx

COPY index.html /usr/share/nginx/html/50x.html
RUN sed -i -r 's/(index  index\.html index\.htm;)/\1 return 503;/g' /etc/nginx/conf.d/default.conf

EXPOSE 80
