iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.49.0.0/16

apt-get update
apt-get install isc-dhcp-relay -y

# Konfigurasi no 3

echo net.ipv4.ip_forward=1 > /sysctl.conf
sysctl -p

echo '
# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="10.49.2.4"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS=""
' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay start