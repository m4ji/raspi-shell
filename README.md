# new-pihole
In the command line, type
```
cd new-pihole
```
Then type
```
sudo bash install.sh
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
