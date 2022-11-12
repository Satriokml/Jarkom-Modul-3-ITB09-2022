echo nameserver 192.168.122.1  etcresolv.conf

apt-get update
apt-get install isc-dhcp-server


# Konfigurasi no 3
echo INTERFACES=eth0  etcdefaultisc-dhcp-server

echo '
subnet 10.49.2.0 netmask 255.255.255.0 {
}
subnet 10.49.1.0 netmask 255.255.255.0 {
    range  10.49.1.50 10.49.1.88;
    range  10.49.1.120 10.49.1.155;
    option routers 10.49.1.1;
    option broadcast-address 10.49.1.255;
    option domain-name-servers 10.49.2.2;
    default-lease-time 300;
    max-lease-time 6900;
}
# Konfigurasi no 4
subnet 10.49.3.0  netmask 255.255.255.0 {
    range 10.49.3.10 10.49.3.30;
    range 10.49.3.60 10.49.3.85;
    option routers 10.49.3.1;
    option broadcast-address 10.49.1.255;
    option domain-name-servers 10.49.2.2;
    default-lease-time 600;
    max-lease-time 6900;
}
# Konfigurasi no 7
host Eden {
    hardware ethernet e2d4b7c3af96;
    fixed-address 10.49.3.13;
}
'  etcdhcpdhcpd.conf

service isc-dhcp-server restart