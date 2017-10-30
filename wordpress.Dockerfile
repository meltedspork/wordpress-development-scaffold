FROM wordpress:latest

LABEL maintainer="Jason Salerno"

RUN apt-get update

# make and go in wordpress-dev dir
RUN mkdir -p /wordpress-dev
WORKDIR /wordpress-dev

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# set wp-cli as executable file
RUN chmod +x /wordpress-dev/wp-cli.phar
RUN mv /wordpress-dev/wp-cli.phar /usr/local/bin/wp

# test wp-cli
RUN wp --info

# finally go to wordpress path
WORKDIR /var/www/html
