#!/bin/bash -eux
git clone git://github.com/zsh-users/zaw.git ~/.zaw
echo "source ${PWD}/zaw/zaw.zsh" >> ~/.zshrc
echo "OK: install-zaw.sh"
