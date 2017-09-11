FROM ubuntu:16.04

ENV APP_DIR="/var/www/html" 

WORKDIR $APP_DIR
VOLUME ./web:$APP_DIR

# Update
RUN apt-get update

# base tool
RUN apt-get install -y \
    curl python git unzip iputils-ping \
    php7.0 php7.0-mysql php7.0-fpm php-mbstring php7.0-xml php7.0-gd composer

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Update
RUN apt-get update

# tool php7
RUN apt-get install -y nodejs build-essential

# nodejs tool
RUN npm install yarn -g && yarn global add gulp 

CMD composer install && yarn && npm rebuild node-sass && gulp


