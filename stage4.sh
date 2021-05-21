#!/bin/bash
git clone https://github.com/slicer69/doas ~/doas
git clone --depth 1 https://github.com/pi-hole/pi-hole.git ~/Pi-hole
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr
exit
