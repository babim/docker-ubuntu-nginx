FROM babim/nginx:base

ENV PHP_VERSION 7.1
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/nginx.sh | bash && \
    curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/php-repo-ubuntu.sh | bash && \
    curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/php7.1.sh | bash

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/**

# Define mountable directories.
VOLUME ["/etc/nginx", "/var/log/nginx", "/var/www", "/etc/php"]

ENTRYPOINT ["/start.sh"]
CMD ["nginx", "-g", "'daemon off;'"]

# Expose ports.
EXPOSE 80 443
