#!/bin/bash
clear
read -p "Enter your username: " username
read -p "Enter the full path of the file you want to encrypt" path
sudo apt-get install gnupg
gpg --gen-key
gpg --export -a $username > public.key
gpg --export-secret-key -a $username > private.key
gpg --import public.key
gpg --allow-secret-key-import --import private.key
gpg -e -u $username -r $username $path
