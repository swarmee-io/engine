sudo kengine swarm init
sudo kengine plugin install --grant-all-permissions weaveworks/net-plugin:2.3.0
sudo mkdir -p /var/lib/kubelet
sudo mkdir -p /var/log/pods
sudo service crio start

URL=https://raw.githubusercontent.com/swarmee-io/swarmee/master/kube-standalone/kube_system.yaml

curl -sSL $URL | sudo stack deploy -c - kube

kubectl config set-cluster local --server=http://127.0.0.1:8080 --insecure-skip-tls-verify=true
kubectl config use-context local
