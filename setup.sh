#!/bin/sh

VERSION=17.06.2-ke-75

sudo add-apt-repository -y ppa:projectatomic/ppa
sudo apt-get update

( cd /tmp && curl -SLO --progress-bar https://github.com/swarmee-io/kengine/releases/download/$VERSION/kengine-${VERSION}.deb )
( cd /tmp && curl -SLO https://raw.githubusercontent.com/weaveworks/weave/2.3/weave )
( cd /tmp && curl -SLO https://github.com/swarmee-io/stack-deploy/releases/download/0.1.1/stack )
chmod +x /tmp/stack

sudo apt-get install -y /tmp/kengine-${VERSION}.deb
sudo service docker start
sudo bash /tmp/weave setup
sudo mv /tmp/stack /usr/local/bin/stack

rm /tmp/kengine-${VERSION}.deb
rm /tmp/weave
