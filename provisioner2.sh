echo "instalando lxd"

sudo apt update && apt upgrade -y
sudo snap install lxd --channel=4.0/stable
lxd version
sudo newgrp lxd

echo "configurando lxd en modo cluster"

sudo cp -v /vagrant/cluster.crt /home/vagrant/cluster.crt
cat preseed.yml | sudo lxd init --preseed
sleep 60

echo "crear contenedor web"

sudo lxc launch ubuntu:20.04 web1 --target servidor2
sleep 20


echo "configurar servidor web"

sudo lxc exec web1 -- sudo apt update -y && apt upgrade -y
sudo lxc exec web1 -- sudo apt install apache2 -y
sudo lxc file push index.html web1/var/www/html/index.html
sudo lxc exec web1 -- sudo systemctl enable apache2
sudo lxc exec web1 -- sudo systemctl restart apache2

sudo lxc copy web1 aux1 --target servidor2
sleep 20
sudo lxc copy web1 bak1 --target servidor2