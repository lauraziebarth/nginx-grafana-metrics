# Análise de uma aplicação WEB executada no NGINX.

Trabalho feito para a aula de **Sistemas Operacionais**. <br>
Neste trabalho foi utilizado: Flask, Gunicorn, Nginx, Grafana+Prometheus.

<br>

###  Máquina Virtual com GNU/LINUX Ubuntu 18.04

Comando pra criar arquivo vagrantfile: 
      
      vagrant init ubuntu/bionic64

Comando para fazer o build da VM: 
      
      vagrant up

Acessando a máquina pelo terminal: 

      vagrant ssh

<br>

### Aplicação

Para criar a pasta do trabalho e instalar as dependencias, execute o arquivo `aplicacao.sh` dentro de sua VM. 

Com as dependências acima instaladas, copie o arquivo `app.py`, para dentro da pasta `trabalho-final` em sua VM. Esse arquivo pode ser encontrado dentro na pasta `vm-trabalho-final`.

Agora, o servidor está pronto para ser executado e a aplicação acessada pelo navegador. <br>
Para isso, via terminal execute o comando: 

     python app.py

Acesse: http://localhost/report

<br>

### WSGI 

Para que a aplicação se comunique com o servidor NGINX, utilizei o Gunicorn. <br>
Foi criado um arquivo de nome `wsgi.py` para fazer o vínculo entre a aplicação e servidor. Copie este arquivo, que esta na pasta `vm-trabalho-final`, para a pasta `trabalho-final` na sua VM.

Agora, para que seja feita a comunicação entre Gunicorn e Flask, execute: 

      gunicorn --bind 0.0.0.0:5000 wsgi:app --reload

<br>

### NGINX

Por fim, para que a aplicação esteja sendo executada no NGINX, execute:
        
      sudo apt-get install nginx

Ao utilizar o servidor NGINX, blocos de servidores podem ser usados para encapsular detalhes de configuração e hospedar mais de um domínio fora de um único servidor. Com isso, o bloco criado para esta aplicação, através do comando `sudo nano /etc/nginx/sites-available/app`, se encontra no caminho `/etc/nginx/sites-available/app.`

Deve conter nesse arquivo somente: 

      server {
          listen 80;
          server_name localhost;

      location / {
        include proxy_params;
        proxy_pass http://unix:/home/vagrant/trabalho-final/app.sock;
          }
      }


Agora, é necessário criar um link simbólico do caminho do bloco para a pasta de aplicações disponíveis através do seguinte comando:<br>
       
       sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled

Devido ao fato de que o NGINX possui sua propria aplicação padrão, é necessária a exclusão do arquivo padrão: 

       sudo rm /etc/nginx/sites-enabled/default

Para que as alterações sejam identificadas, se faz necessário a reinicialização do serviço NGINX e pode ser realizado via terminal, através do comando: 
      
       sudo systemctl restart nginx

Além disso, o firewall da máquina deve ser habilitado com o comando `sudo ufw allow 'Nginx Full'` para liberar acesso ao NGINX. 

Assim, a aplicação está sendo executada pelo **NGINX** e pode ser acessada pelo navegador através da url https://0.0.0.0/report.


