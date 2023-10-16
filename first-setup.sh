# update, node, npm, go , rust, geth, ignite

# update
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg

# install essential files including gcc: c++ compiler
sudo apt install build-essential

# enable universe repository
sudo add-apt-repository universe

# install nodejs and npm
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y

# install golang
curl -OL https://golang.org/dl/go1.20.linux-amd64.tar.gz
sha256sum go1.20.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.20.linux-amd64.tar.gz
sudo nano ~/.profile
# insert into .profile
export PATH=$PATH:/usr/local/go/bin
# exit
source ~/.profile
# check if go is installed 
go version

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# select option 1: process with installation (default)
source "$HOME/.cargo/env"
rustc --version

sudo apt install make

# install geth
git clone https://github.com/ethereum/go-ethereum.git
cd go-ethereum
make geth
# last line: Run "./build/bin/geth" to launch geth.
nano ~/.bashrc
# paste this in last line
export PATH=$PATH:/home/aakash/go-ethereum/build/bin
# exit
source ~/.bashrc  # or source ~/.zshrc for Zsh
cd ~

# ignite install
curl https://get.ignite.com/cli! | bash

# install postgres
sudo apt install postgresql postgresql-contrib
# start postgres to test or build
sudo systemctl start postgresql.service

# install gh (github)
sudo apt install gh

# install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update; sudo apt upgrade;
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# verify if docker is intalled 
sudo docker run hello-world

# install mongo
cd ~
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# install 
# install 