echo nameserver 192.168.122.1 > /etc/resolv.conf

echo '
auto eth0
iface eth0 inet dhcp
hwaddress ether e2:d4:b7:c3:af:96
' > /etc/network/interfaces