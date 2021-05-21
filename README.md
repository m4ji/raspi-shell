# raspi-shell
In the command line, type
```
cd raspi-shell
```
Then type
```
sudo bash preinstall.sh && sudo bash install.sh && sudo bash gc.sh
```
After the scripts finish, run these commands for doas in the doas directory
```
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
cd "Pi-hole/automated install/"
sudo bash basic-install.sh
```
Finally, type
```
bash postinstall.sh
```
