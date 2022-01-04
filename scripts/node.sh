#! /bin/bash

/bin/bash /vagrant/configs/join.sh -v

sudo -i -u $USER bash << EOF
mkdir -p $HOME/.kube
sudo cp -i /vagrant/configs/config $HOME/.kube/
sudo chown $(id -u):$(id -g) $HOME/.kube/config
NODENAME=$(hostname -s)
kubectl label node $(hostname -s) node-role.kubernetes.io/worker=worker-new
EOF