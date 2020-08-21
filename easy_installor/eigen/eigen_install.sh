# Author: innerNULL
# Date: 2019-03-12


ROOT=$(pwd)

wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz
tar -zxvf *.tar.gz -C ./
#git clone https://github.com/eigenteam/eigen-git-mirror.git
mv ./eigen-eigen* ./eigen

cd ./eigen && mkdir ./build && cd ./build
cmake ../
make install

# config a bug
cd /usr/local/include
ln -sf eigen3/Eigen Eigen
ln -sf eigen3/unsupported unsupported
cd ${ROOT}

rm ./*.tar.gz 
rm -rf ./eigen
