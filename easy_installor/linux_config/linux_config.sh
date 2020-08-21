# Author: innerNULL
# Date: 2019-03-11

# This is used to build my customized docker container development 
# environment.


apt-get update
apt-get install -y --no-install-recommends \
    cmake \
    git \
    zsh \
    curl \
    vim \
    wget \
    tar \
    tmux \
    ssh \
    gcc g++ \
    ca-certificates
apt-get apt-get remove openssh-client openssh-server
apt-get install openssh-client openssh-server
service ssh restart
rm -rf /var/lib/apt/lists/*

chsh -s /usr/bin/zsh && zsh

# config tmux
touch ~/.tmux.conf 
echo "set -g mode-keys vi" >> ~/.tmux.conf 
echo set -g default-terminal "screen-256color" >> ~/.tmux.conf
echo export TERM=xterm-256color >> ~/.zshrc

# Fix zsh tab completion duplicating command name bug
echo DISABLE_AUTO_TITLE="true" >> ~/.zshrc 

# sync .zshrc
cat ~/.bashrc >> ~/.zshrc
# install oh-my-zsh
sh -c "$(wget --no-check-certificate https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# install spacevim
curl -sLf https://spacevim.org/cn/install.sh | bash

#curl -o ./miniconda.sh -O  \
#    https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
#chmod +x ./miniconda.sh && \
#bash ./miniconda.sh -b -p /opt/conda && \
#rm ~/miniconda.sh && \

# install python and pip
apt-get update && apt-get -y install python3 python3-pip 
#echo "alias python=python3" >> ~/.bashrc
echo "alias python=python3" >> ~/.zshrc
echo "alias pip=pip3" >> ~/.zshrc
source ~/.zshrc

# install necessary python libraries
# TODO: Fix following `pip` bug
pip install numpy \
            pandas \
            pytorch \
            sklearn

rm -rf ./*
