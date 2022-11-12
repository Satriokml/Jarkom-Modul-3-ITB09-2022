echo nameserver 192.168.122.1 > /etc/resolv.conf

echo '
auto eth0
iface eth0 inet dhcp
' > /etc/network/interfaces