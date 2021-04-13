#!/bin/bash
#
# Copyright 2020 (c) Ayane Satomi.
# Licensed under MIT.
# 
# This version runs when invoked on $HOME/.bashrc
# To get this version to work as intended, add the following lines on /root/.bashrc:
#
# bash $HOME/firstrun
#
set -euo pipefail

printf "Please create your UNIX username. The username doesn't need to be the same as your Windows username.\n"

read -p "Enter your UNIX username: " input;

while [ -z "$input" ]; do
    echo "Error: name cannot be empty. Try again."
    read -p "Enter your UNIX username: " input;
done

# delegate the user creation to adduser.
adduser $input

# Now we created the user we still have to tell WSL2 to use that user before we su into the user.
touch /etc/wsl.conf
printf "[user]\ndefault=$input" > /etc/wsl.conf

# Grant them permission to sudo then finally comment out firstrun in the bashrc so we don't end up with a nasty loop.
usermod -aG sudo $input
sed -i '/bash $HOME\/firstrun/s/^/#/g' $HOME/.bashrc

echo "Thank you for completing the first run setup. You will now be switched to your user."

# Now we switch to that user!
su $input;
