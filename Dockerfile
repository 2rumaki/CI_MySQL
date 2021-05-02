# FROM mqsql/mysql-server:5.7.13
FROM php:7.4.16-apache
RUN docker-php-ext-install pdo_mysql
COPY php.ini.dev /usr/local/etc/php/php.ini
COPY vimrc /root/.vimrc

RUN apt update && apt upgrade -y
RUN apt install -y vim less wget iputils-ping unzip

WORKDIR /CodeIgniter_sorce
ARG CI_ZIP_URL="https://github.com/bcit-ci/CodeIgniter/archive/refs/heads/3.1-stable.zip"
RUN wget $CI_ZIP_URL && unzip 3.1-stable.zip

RUN echo "alias lsl='ls -thlrF'" >> ~/.bashrc
