# Quickly GCC Instalation

## Prerequests (In Order)
### m4
* Update configs in `./quickly_install/m4/install_from_release.sh`
* Run `bash ./quickly_install/m4/install_from_release.sh`
* Run sth like `ln -s ${HOME}/bin/m4-1.4.10/bin/m4 ${HOME}/bin/m4` 

### flex
* Update configs in `./quickly_install/flex/install_from_release.sh`
* Run `bash ./quickly_install/flex/install_from_release.sh`
* Run sth like:
```shell
ln -s ${HOME}/bin/flex-2.6.4/bin/flex ${HOME}/bin/flex
ln -s ${HOME}/bin/flex-2.6.4/bin/flex++ ${HOME}/bin/flex++
```

## Usage
* Update configs in `./quickly_install/gcc/install_from_release.sh`
* Run `bash ./quickly_install/gcc/install_from_release.sh`
* Symbolic link, run commands like:
```shell
ln -s ${HOME}/bin/gcc-13.1.0/bin/gcc ${HOME}/bin/gcc
ln -s ${HOME}/bin/gcc-13.1.0/bin/g++ ${HOME}/bin/g++
```
* Add following two lines in your `.bashrc` file if needed
```shell
alias gcc=${HOME}/bin/gcc
alias g++=${HOME}/bin/g++
```
