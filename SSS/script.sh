echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install lynx

export http_proxy="http://10.49.2.3:8080"
# Command to check http_proxy connection
# env | grep -i proxy

echo '
auto eth0
iface eth0 inet dhcp
' > /etc/network/interfaces