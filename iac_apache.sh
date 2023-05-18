#!/bin/bash

echo "Procurando atualizações de pacote"

apt-get update

echo "Atualizando pacotes"
apt-get upgrade -y

echo "Instalando Apache 2 e unzip"
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando arquivos do repositório"

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

cd linux-site-dio-main/
cp -R * /var/www/html/

systemctl enable apache2
systemctl start apache2
