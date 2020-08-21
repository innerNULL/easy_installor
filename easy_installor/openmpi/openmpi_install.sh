# Author:
# Date: 2019-03-13

version_l1="4.0"
version_l2="0"

name_temp=openmpi-${version_l1}.${version_l2}

wget https://download.open-mpi.org/release/open-mpi/v${version_l1}/${name_temp}.tar.gz
tar -zxvf ./${name_temp}.tar.gz
rm ./*.tar.gz
mv ./${name_temp} ./openmpi

cd ./openmpi
./configure --prefix=/usr/local
make -j8 all install

ldconfig

echo "MPI_ROOT=/usr/local" >> ~/.zshrc
echo "export PATH=$MPI_ROOT/bin:$PATH" >> ~/.zshrc
echo "export MANPATH=$MPI_ROOT/man:$MANPATH" >> ~/.zshrc
source ~/.zshrc

cd ../
#rm -rf openmpi
