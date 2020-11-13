#!/bin/bash

# Para rodar, execute:
# chmod +x trabalho-final.sh
# ./trabalho-final.sh

# atualizando o apt-get, que é um gerenciador de pacote do linux
echo "Fazendo update do apt-get..."
sudo apt-get update 

# instlando dependencias python
echo "Instalando dependencias Python..."
sudo apt-get install python3-pip python3-dev  

# criando diretório para armazenar os arquivos do programa
echo "Criando diretório..."
mkdir trabalho-final

# entrando no diretório criado
echo "Acessando diretório..."
cd trabalho-final/

# instalando lib para criar ambiente virtual
echo "Instalando biblioteca Python venv..."
sudo apt-get install python3-venv

# criando o diretório da nossa maquina virtual 
echo "Criando venv..."
python3 -m venv app-so

# executando o ambiente virtual python
echo "Executando o ambiente virtual..."
source app-so/bin/activate

# instalando gunicorn e flask
echo "Instalando Gunicorn e Flask..."
pip install gunicorn flask
