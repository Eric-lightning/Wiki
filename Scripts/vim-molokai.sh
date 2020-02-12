#!/bin/bash
echo "test"
source /etc/os-release
set e

echo "Vim - apply Molokai theme 20190812"

case "$NAME" in
 "Ubuntu" ) sudo apt install -y vim git  ;;
 * ) echo "unknown dist.";;
esac;
echo "git cloning"

git clone https://github.com/tomasr/molokai.git molokai ;
mkdir -p ~/.vim/colors/
mv molokai/colors/molokai.vim ~/.vim/colors/
rm -rf ~/molokai/
echo "syntax on" >> ~/.vimrc
echo "colorscheme molokai" >> ~/.vimrc

######
echo "OK: vim-molokai.sh"
