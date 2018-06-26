sudo docker swarm init
sudo docker plugin install --grant-all-permissions weaveworks/net-plugin:2.3.0
curl  | sudo stack deploy -c- kube
