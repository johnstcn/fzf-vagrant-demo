#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install -y vim git
echo "Downloading and installing ripgrep"
wget -c -q -P /home/vagrant/ 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb'
sudo dpkg -i /home/vagrant/ripgrep*.deb
echo "Downloading and installing fd"
wget -c -q -P /home/vagrant/ 'https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb'
sudo dpkg -i /home/vagrant/fd*.deb
echo "Downloading and installing fzf"
[[ ! -d .fzf ]] && git clone --depth 1 https://github.com/junegunn/fzf.git /home/vagrant/.fzf && ~/.fzf/install --all
#wget -c -q -P /home/vagrant/ 'https://github.com/junegunn/fzf/releases/download/0.26.0/fzf-0.26.0-linux_amd64.tar.gz'
#tar -xzvf /home/vagrant/fzf* -C /usr/local/bin/
#chmod +x /usr/local/bin/fzf
echo "Downloading and installing powerline-go"
wget -c -q -P /home/vagrant/ 'https://github.com/justjanne/powerline-go/releases/download/v1.21.0/powerline-go-linux-amd64'
sudo mv /home/vagrant/powerline-go-linux-amd64 /usr/local/bin/powerline-go
sudo chmod +x /usr/local/bin/powerline-go
echo "Downloading and installing bat"
wget -c -q -P /home/vagrant/ 'https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_amd64.deb'
sudo dpkg -i /home/vagrant/bat*.deb
echo "Copying vimrc"
cp -v /vagrant/vimrc /home/vagrant/.vimrc
echo "Updating bashrc"
cat /vagrant/bashrc >> /home/vagrant/.bashrc
echo "Cloning a big git repo"
git clone https://gerrit.nordix.org/infra/engine
echo "Done!"
