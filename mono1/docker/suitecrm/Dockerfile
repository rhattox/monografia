FROM php:7.4-apache-buster
# DEFINE A REGIÃO GEOGRÁFICA PARA APACHE
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# BAIXA E INSTALA OS APLICATIVOS NECESSÁRIOS
RUN apt-get update -y
RUN apt-get install -y zip wget libzip-dev
# CONFIGURAÇõES BÁSICAS PARA O SUITECRM
RUN rm -f /var/www/html/index.html
COPY --chown=www-data:www-data ./SuiteCRM-7.11.21/ /var/www/html
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install zip 
