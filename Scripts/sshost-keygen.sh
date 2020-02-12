#!/bin/bash -e
echo "Creation My Best Keygen Script"
#------------------
echo -n "Input Key Type [ rsa | ecdsa | ed25519 ] :"
read sshkeyType
#-----
echo "Key Bits selects:"
echo "RSA : 4096, ECDSA: 256 | 384 | 521, EdRSA(ed25519) 256 ONLY"
echo "-----------------------------------------------------------"
echo -n "Input Key Bit :"
read  sshkeyBit
echo -n "Key Name :"
read sshkeyName
echo -n "Key Dir Title :"
read sshostTitle

#----------------------
mkdir ~/.ssh/sshost.$sshostTitle
eval "ssh-keygen -b $sshkeyBit -t $sshkeyType -f ~/.ssh/sshost.$sshostTitle/$sshkeyName"
#-----
echo "-------------------"
echo "subconf configuration"
echo -n "Host Identify :"
read sshostIdentify
echo -n "IP/HOST :"
read sshostName
echo -n "Username :"
read  sshostUser
#----------------
echo " 
Host $sshostIdentify
    HostName $sshostName
    User $sshostUser
    IdentifyFile ~/.ssh/sshost.$sshostTitle/$sshkeyName
" > "~/.ssh/sshost.$sshostTitle/subconf"

echo "OK"
echo "> ~/.ssh/sshost.$sshostTitle"
ls -Fl  ~/.ssh/sshost.$sshostTitle

