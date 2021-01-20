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
    libssl-dev \
    p7zip-full \
    make
apt-get remove openssh-client openssh-server
apt-get install openssh-client openssh-server
service ssh restart
rm -rf /var/lib/apt/lists/*


# Configs
# config tmux
curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/tmux/tmux.conf >> ~/.tmux.conf
# Config bash
echo DISABLE_AUTO_TITLE="true" >> ~/.bashrc
curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/bash/bashrc >> ~/.bashrc
# Config vim
curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/vim/vimrc >> ~/.vimrc

rm -rf ./*


# Install execs
mkdir -p /tmp/install && cd /tmp/install
# install python
curl https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/python/install.sh | sh
# install poetry
curl https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/poetry/install.sh | sh
# install cmake
curl https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/cmake/install.sh | sh
# clean
rm -rf /tmp/install
