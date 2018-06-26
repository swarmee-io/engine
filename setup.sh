#!/bin/sh

sudo add-apt-repository -y ppa:projectatomic/ppa
sudo apt-get update
wget -P /tmp https://github.com/swarmee-io/kengine/releases/download/17.06.2-ke-75/kengine-17.06.2-ke-75.deb
wget -P /tmp https://raw.githubusercontent.com/weaveworks/weave/2.3/weave

sudo apt-get install -y /tmp/kengine-17.06.2-ke-75.deb
sudo service docker start
sudo bash /tmp/weave setup
