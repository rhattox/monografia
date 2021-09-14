FROM php:7.4-apache-buster
# DEFINE A REGIÃO GEOGRÁFICA PARA APACHE
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# BAIXA E INSTALA OS APLICATIVOS NECESSÁRIOS
RUN apt-get update -y
RUN apt-get install -y zip wget libzip-dev
RUN wget https://suitecrm.com/files/162/SuiteCRM-7.11/560/SuiteCRM-7.11.21.zip 
# CONFIGURAÇõES BÁSICAS PARA O SUITECRM
RUN rm -f /var/www/html/index.html
RUN unzip SuiteCRM-7.11.21.zip 
COPY ./source/install_folders.sh /install_folders.sh
RUN chmod +x /install_folders.sh
RUN /bin/bash /install_folders.sh
RUN cp -a ./SuiteCRM-7.11.21/* /var/www/html/
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install zip 
