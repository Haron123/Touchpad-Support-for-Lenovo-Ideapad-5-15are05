# Touchpad-Support-for-Lenovo-Ideapad-5-15are05 on Archlinux
Helps with the common issue of the Touchpad not working on the Ideapad 15are05, might work for other laptops aswell.
* Tested and Working in Manjoro


## Installation :

All you gotta do is either run the touch.sh in the repo. (note: needs root permissions)

##### OR

Execute these lines yourself as root

```
modprobe i2c_hid
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/elants_i2c/unbind
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/i2c_hid/bind
echo "blacklist elants_i2c" | tee /etc/modprobe.d/touchpad.con
```



