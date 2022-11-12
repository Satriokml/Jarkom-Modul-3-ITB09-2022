echo nameserver 192.168.122.1 > /etc/resolv.conf

# Konfigurasi basic no 8
apt-get update
apt-get install squid
mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

# Konfigurasi no 8.1
echo '
acl AVAILABLE_WORKING time MTWHF 00:00-07:59
acl AVAILABLE_WORKING time MTWHF 17:01-23:59
acl AVAILABLE_WORKING time SA 00:00-23:59
' > /etc/squid/acl.conf
echo '
include /etc/squid/acl.conf
http_port 8080
http_access allow AVAILABLE_WORKING
http_access deny all
visible_hostname Berlint
# Konfigurasi no 8.2
acl loid dstdomain loid-work.com
acl franky dstdomain franky-work.com
http_access allow loid
http_access allow franky
' > /etc/squid/squid.conf