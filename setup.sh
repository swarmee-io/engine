#!/bin/sh

ENGINE_VERSION=18.03.2-ke-2
WNET_VERSION=2.3
STACK_VERSION=0.1.5
KUBE_VERSION=v1.10.5

sudo add-apt-repository -y ppa:projectatomic/ppa
sudo apt-get update

( cd /tmp && curl -SLO --progress-bar https://github.com/swarmee-io/kengine/releases/download/${ENGINE_VERSION}/kengine-${ENGINE_VERSION}.deb )
( cd /tmp && curl -SLO --progress-bar https://raw.githubusercontent.com/weaveworks/weave/${WNET_VERSION}/weave )
( cd /tmp && curl -SLO --progress-bar https://github.com/swarmee-io/stack-deploy/releases/download/${STACK_VERSION}/stack )
( cd /tmp && curl -LO --progress-bar https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl )
chmod +x /tmp/stack
chmod +x /tmp/kubectl

sudo apt-get install -y /tmp/kengine-${ENGINE_VERSION}.deb
sudo service docker start
sudo bash /tmp/weave setup
sudo mv /tmp/stack /usr/local/bin/stack
sudo mv /tmp/kubectl /usr/local/bin/kubectl

rm /tmp/kengine-${ENGINE_VERSION}.deb
rm /tmp/weave
