#!/bin/sh

VERSION=17.06.2-ke-76

sudo add-apt-repository -y ppa:projectatomic/ppa
sudo apt-get update

( cd /tmp && curl -SLO --progress-bar https://github.com/swarmee-io/kengine/releases/download/$VERSION/kengine-${VERSION}.deb )
( cd /tmp && curl -SLO --progress-bar https://raw.githubusercontent.com/weaveworks/weave/2.3/weave )
( cd /tmp && curl -SLO --progress-bar https://github.com/swarmee-io/stack-deploy/releases/download/0.1.1/stack )
( cd /tmp && curl -LO --progress-bar https://storage.googleapis.com/kubernetes-release/release/v1.9.8/bin/linux/amd64/kubectl )
chmod +x /tmp/stack
chmod +x /tmp/kubectl

sudo apt-get install -y /tmp/kengine-${VERSION}.deb
sudo service docker start
sudo bash /tmp/weave setup
sudo mv /tmp/stack /usr/local/bin/stack
sudo mv /tmp/kubectl /usr/local/bin/kubectl

rm /tmp/kengine-${VERSION}.deb
rm /tmp/weave
