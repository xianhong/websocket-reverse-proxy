FROM httpd:latest
ENV WS_PATH ray
COPY MyCert.crt /usr/local/apache2/conf/server.crt
COPY MyKey.key /usr/local/apache2/conf/server.key
COPY httpd.conf /usr/local/apache2/conf/
COPY virtualhost.conf  /usr/local/apache2/conf/extra/

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf 
CMD ["/usr/local/apache2/bin/apachectl", "-D", "FOREGROUND"]
