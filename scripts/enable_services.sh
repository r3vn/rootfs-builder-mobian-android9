#!/bin/sh
# enable ssh as root
HOSTNAME=mobian

# set hostname
echo $HOSTNAME > /etc/hostname
{
	echo '127.0.0.1	localhost mobian'
        echo ' '
        echo '# The following lines are desirable for IPv6 capable hosts'
        echo '::1	localhost ip6-localhost ip6-loopback'
        echo 'ff02::1	ip6-allnodes'
        echo 'ff02::2	ip6-allrouters'
} > /etc/hosts

# enable ssh root login
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# make phosh executable
chmod +x /usr/bin/phosh

# enable services
systemctl enable mount-android
systemctl enable remount-root-rw
systemctl enable lxc@android
systemctl enable usb-tethering
systemctl enable ssh
systemctl enable ofono
systemctl enable phosh
systemctl disable rsyslog
