# raspi-shell
In the command line, type
```
cd raspi-shell
```
Then type
```
sudo bash newinstall.sh
```
After the scripts finish, run these commands for doas
```
cd
cd doas
make
sudo make install
sudo vidoas
```
In vidoas, type
```
permit nopass pi as root
```
For the Pi-hole, type
```
cd
cd "Pi-hole/automated install/"
sudo bash basic-install.sh
```
