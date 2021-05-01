modprobe i2c_hid
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/elants_i2c/unbind
echo "i2c-ELAN0001:00" > /sys/bus/i2c/drivers/i2c_hid/bind
echo "blacklist elants_i2c" | tee /etc/modprobe.d/touchpad.con