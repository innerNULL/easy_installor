# Author: innerNULL 
# Date: 2021-01-17


set -x



apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get install -y --no-install-recommends \
    software-properties-common \
    git \
    zsh \
    curl \
    vim \
    wget \
    tar \
    unzip \
    tmux \
    ssh \
    gcc g++ \
    autoconf \
    automake \
    make \
    libtool \
    ca-certificates \
    libssl-dev \
    libffi-dev \
    build-essential \
    p7zip-full \
    sudo
apt-get remove openssh-client openssh-server
apt-get install openssh-client openssh-server
service ssh restart
rm -rf /var/lib/apt/lists/*


curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit


# Configs
# config tmux
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/config4/main/config4/tmux/tmux.conf >> ~/.tmux.conf
# Config bash
echo DISABLE_AUTO_TITLE="true" >> ~/.bashrc
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/config4/main/config4/bash/bashrc >> ~/.bashrc
# Config vim
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/config4/main/config4/vim/vimrc >> ~/.vimrc

rm -rf ./*


# Install execs
mkdir -p /tmp/install && cd /tmp/install
# install python
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/python/install.sh | sh
# install poetry
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/poetry/install.sh | sh
# install cmake
curl https://ghproxy.com/https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/cmake/install.sh | sh
# clean
rm -rf /tmp/install


# Post progress
ldconfig
