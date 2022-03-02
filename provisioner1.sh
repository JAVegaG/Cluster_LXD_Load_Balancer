echo "instalando lxd"

sudo apt update && apt upgrade -y
sudo snap install lxd --channel=4.0/stable
lxd version
sudo newgrp lxd

echo "configurando lxd en modo cluster"

cat preseed.yml | sudo lxd init --preseed
sleep 60
sudo cp -v /var/snap/lxd/common/lxd/cluster.crt /vagrant/cluster.crt

echo "crear contenedor haproxy"

sudo lxc launch ubuntu:20.04 haproxy
sleep 20

echo "configurar servidor haproxy"

sudo lxc exec haproxy -- sudo apt update -y && apt upgrade -y
sudo lxc exec haproxy -- sudo apt install haproxy -y
sudo lxc file push index.html haproxy/etc/haproxy/haproxy.cfg
sudo lxc exec haproxy -- sudo systemctl enable haproxy
sudo lxc exec haproxy -- sudo systemctl restart haproxy