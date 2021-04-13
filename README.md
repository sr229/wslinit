# First-time user init script for WSL2 distros

Based on how DistroLauncher-based distros does their thing, you can now painlessly add a first time user without using DistroLauncher for that purpose.

## How does it work?

DistroLauncher-based distros always execute on the following sequence:

- Ask you for your first time username and password
- If already initiated, just run using that user.

However, we don't have that liberty if we use standard `wsl --import`, so here's a little sample!

## Using

First of all, put the shell script in the appropriate place, somewhere in `/usr/bin/` or similar, then simply add it on `$HOME/.bashrc` on the `root` user.

You will have to figure out how to prevent re-executing the script yourself. A good way to do this is to comment out the line where this script is getting initialized after the successful invocation of this script first time.

A sample version of this would be [`firstrun.sh`](https://github.com/sr229/wslinit/blob/master/firstrun.sh) located in this repository.

## Copyright

Copyright 2020 &copy; Ayane Satomi. Licensed under MIT.
