# Author:
# Date: 2019-03-13


wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.gz
tar -zxvf ./openmpi*
rm ./*.tar.gz
mv ./openmpi* ./openmpi

cd ./openmpi
./configure --prefix=/usr/local
make -j8 all install

ldconfig

echo "MPI_ROOT=/usr/local" >> ~/.zshrc
echo "export PATH=$MPI_ROOT/bin:$PATH" >> ~/.zshrc
echo "export MANPATH=$MPI_ROOT/man:$MANPATH" >> ~/.zshrc
source ~/.zshrc

cd ../
rm -rf openmpi
