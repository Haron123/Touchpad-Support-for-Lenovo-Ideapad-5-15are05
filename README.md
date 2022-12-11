# Touchpad-Support-for-Lenovo-Ideapad-5-15are05 on Archlinux
Helps with the common issue of the Touchpad not working on the Ideapad 15are05, might work for other laptops aswell.
* Tested and Working in Manjoro  
Source : https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_15are05  

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

### This has to be executed after each restart so best use would be autorunning it at each boot

To autorun it at each boot we first have to change the script by adding the following line at the Beginning.

```
#!/bin/bash
```

the file should end up looking like this

```
#!/bin/bash

modprobe i2c_hid
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/elants_i2c/unbind
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/i2c_hid/bind
echo "blacklist elants_i2c" | tee /etc/modprobe.d/touchpad.con
```

Make your script executeable.

```
chmod u+x /script/path.sh
```


In Order to then make it start at each boot were gonna use systemd.
create a .service file in /etc/systemd/system/

```
sudo nano /etc/systemd/system/sampleservice.service
```
Copy paste this into it and modify the "ExecStart" to the path of your script.

```
[Unit]
Description = Fixes the Touchpad

[Service]

ExecStart= /script/path.sh

[Install]
WantedBy=multi-user.target

```
Start the service file by the name using
```
systemctl start sampleservice.service
```
To enable on startup 
```
systemctl enable sampleservice.service
```
To check the status
```
systemctl status sampleservice.service
```
To stop 
```
systemctl stop sampleservice.service
```

### Reboot and see if it works !





