#!/bin/bash

# Para rodar, execute:
# chmod +x granafa.sh
# ./grafana.sh

echo "Fazendo update do server..."
sudo apt update
sudo apt upgrade


echo "Adicionando Grafana gpg key..."
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

echo "Update no repositório..."
sudo apt update

echo "Instalando Grafana..."
sudo apt -y install grafana

echo "Iniciando Grafana..."
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Habilite Grafana para iniciar na inicialização..."
sudo systemctl enable grafana-server

echo "Criando proxy reverso para arquivo de config Grafana..."
sudo nano /etc/nginx/sites-available/grafana.conf

{
    echo "server {
     listen 80;

     server_name yourdomainname.com;

     location / {
         proxy_pass http://localhost:3000;
         proxy_http_version 1.1;
         proxy_set_header Upgrade $http_upgrade;
         proxy_set_header Connection 'upgrade';
         proxy_set_header Host $host;
         proxy_cache_bypass $http_upgrade;
     }
    }"
} >> /etc/nginx/sites-available/grafana.conf

echo "Criando link simbolico..."
sudo ln -s /etc/nginx/sites-available/grafana.conf /etc/nginx/sites-enabled/grafana.conf
