#!/bin/bash 
if test -e "/home/$USER/.brew/bin/brew";
then 
	echo "Brew Packages exist! if you want to re-install, press enter. ( Cancel = ctrl+C )"
	read
	rm -rf /home/$USER//.brew
fi

git clone https://github.com/Homebrew/brew ~/.brew

PATH2="/home/$USER/.brew/bin" # insertBy nesc'

if [[ "$SHELL" == *bash ]] ;
then 
	echo 'export PATH=''"''$PATH:'"$PATH2"'"' >> ~/.bashrc
	source ~/.bashrc
	echo "OK, exported to bashrc"
elif [[ "$SHELL" == *zsh* ]] ; 
then
	echo 'export PATH=''"''$PATH:'"$PATH2"'"' >> ~/.zshrc
	source ~/.zshrc
	echo "OK, exported to zshrc"
else
	echo "Please export PATH to /home/$USER/.brew/bin and reload run commands file"
fi 
echo "OK"
