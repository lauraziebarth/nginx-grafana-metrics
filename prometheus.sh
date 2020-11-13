sudo su -  
  
export RELEASE="2.2.1"   
  
wget https://github.com/prometheus/prometheus/releases/download/v${RELEASE}/prometheus-${RELEASE}.linux-amd64.tar.gz 

 
tar xvfz prometheus-*.tar.gz 
 

cd prometheus-* 