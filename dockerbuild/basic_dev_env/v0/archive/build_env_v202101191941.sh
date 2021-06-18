# Author: innerNULL 
# Date: 2021-01-17


set -x

apt-get update
apt-get install -y --no-install-recommends \
    git \
    zsh \
    curl \
    vim \
    wget \
    tar \
    tmux \
    ssh \
    gcc g++ \
    ca-certificates \
    libssl-dev
apt-get remove openssh-client openssh-server
apt-get install openssh-client openssh-server
service ssh restart
rm -rf /var/lib/apt/lists/*


# Configs
# config tmux
touch ~/.tmux.conf && curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/tmux/tmux.conf >> ~/.tmux.conf
# Config bash
echo DISABLE_AUTO_TITLE="true" >> ~/.bashrc
curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/bash/bashrc >> ~/.zshrc
# Config vim
touch ~/.vimrc && curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/vim/vimrc >> ~/.vimrc

# install python and pip
apt-get update && apt-get -y install python3 python3-pip 
#echo "alias python=python3" >> ~/.bashrc
echo "alias python=python3" >> ~/.zshrc
echo "alias pip=pip3" >> ~/.zshrc
source ~/.zshrc

# install necessary python libraries
# TODO: Fix following `pip` bug
#pip install numpy \
#            pandas \
#            pytorch \
#            sklearn

rm -rf ./*

# Untest apt install
apt install p7zip-full


# install execs
mkdir -p /tmp/install && cd /tmp/install
# install cmake
curl https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/cmake/install.sh | sh
# clean
rm -rf /tmp/install
