#!/bin/bash
# file: install.sh
# date: 2021-01-19


set -x

python -m pip install --user poetry

echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# Python poetry config" >> ~/.bashrc
echo "alias poetry='python -m poetry'" >> ~/.bashrc
echo "# Python poetry config end" >> ~/.bashrc

. ~/.bashrc
