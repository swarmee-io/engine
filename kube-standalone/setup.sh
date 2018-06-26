sudo docker swarm init
sudo docker plugin install --grant-all-permissions weaveworks/net-plugin:2.3.0
curl -sSL https://raw.githubusercontent.com/swarmee-io/swarmee/master/kube-standalone/kube_system.yaml | sudo stack deploy -c- kube
