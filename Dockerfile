FROM debian:buster
EXPOSE 80 443
COPY src/install.sh /
COPY src/setup.sh /
COPY src/phpMyAdmin-4.9.2-all-languages.zip /
COPY src/default /
COPY src/wordpress-5.3.zip /
COPY src/nginx-selfsigned.crt /
COPY src/nginx-selfsigned.key /
RUN bash install.sh
CMD ["/bin/bash", "setup.sh"]
