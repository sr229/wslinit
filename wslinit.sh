#!/bin/bash
# Copyright 2020 (c) Ayane Satomi.
# Licensed under MIT.
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

# Now we switch to that user!
su $input;