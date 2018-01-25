sudo -u root touch /etc/resolv.conf
sudo -u root echo "nameserver 8.8.8.8" > /etc/resolv.conf
sudo -u root echo "nameserver 8.8.4.4" >> /etc/resolv.conf

sudo -u root route add default gw 192.168.6.1 usb1
sudo -u root route add default gw 192.168.7.1 usb0
