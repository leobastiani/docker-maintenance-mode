FROM nginx

COPY index.html /usr/share/nginx/html/50x.html
RUN sed -i -r 's/(index  index\.html index\.htm;)/\1 return 503;/g' /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK --interval=60s --timeout=30s --start-period=1s --retries=3 CMD test $(curl -o /dev/null -s -w "%{http_code}\n" http://localhost) -eq 503
