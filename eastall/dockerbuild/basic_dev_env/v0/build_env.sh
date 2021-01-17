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

chsh -s /usr/bin/zsh && zsh

# config tmux
touch ~/.tmux.conf && curl https://raw.githubusercontent.com/innerNULL/config4/main/config4/tmux/tmux.conf >> ~/.tmux.conf
# Fix zsh tab completion duplicating command name bug
echo DISABLE_AUTO_TITLE="true" >> ~/.zshrc
# sync .zshrc
cat ~/.bashrc >> ~/.zshrc
# install oh-my-zsh
sh -c "$(wget --no-check-certificate https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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



# install execs
mkdir -p /tmp/install && cd /tmp/install
# install cmake
curl https://raw.githubusercontent.com/innerNULL/eastall/master/eastall/cmake/install.sh | sh
# clean
rm -rf /tmp/install
