# Jarkom-Modul-3-ITB09-2022

Laporan Resmi Praktikum Jaringan Komunikasi Modul 2

---

## Anggota Kelompok
Nama | NRP
--- | ---
Rama Muhammad Murshal | 5027201041
Satrio Kamil Widhiwoso | 5027201051
Fairuz Azhar Auzan | 5027201059

## Daftar Isi
- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3 dan 4](#soal-3-dan-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)

---

## Topologi
![Topologi jaringan](./images/topologi.png)

---
### Soal 1
Loid bersama Franky berencana membuat peta tersebut dengan kriteria WISE sebagai DNS Server, Westalis sebagai DHCP Server, Berlint sebagai Proxy Server.

### Jawaban
**WISE**

```
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install bind9 -y
```

**Westalis**

```
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install isc-dhcp-server
```

**Berlint**

```
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install squid
```
---

### Soal 2
Ostania sebagai DHCP Relay

### Jawaban
**Ostania**

```
apt-get update
apt-get install isc-dhcp-relay -y
```

### Soal 3 dan 4
Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.50 - [prefix IP].1.88 dan [prefix IP].1.120 - [prefix IP].1.155. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.10 - [prefix IP].3.30 dan [prefix IP].3.60 - [prefix IP].3.85

**Westalis**

```
echo INTERFACES="eth0" > /etc/default/isc-dhcp-server

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
subnet 10.49.3.0  netmask 255.255.255.0 {
    range 10.49.3.10 10.49.3.30;
    range 10.49.3.60 10.49.3.85;
    option routers 10.49.3.1;
    option broadcast-address 10.49.1.255;
    option domain-name-servers 10.49.2.2;
    default-lease-time 600;
    max-lease-time 6900;
}
' >> /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```

### Soal 5
Client mendapatkan DNS dari WISE dan client dapat terhubung dengan internet melalui DNS tersebut.

### Jawaban
**Client**

```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Soal 6
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 5 menit sedangkan pada client yang melalui Switch3 selama 10 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 115 menit.

### Jawaban
**Switch 1**
```
default-lease-time 300
max-lease-time 6900;

```

**Switch 2**
```
default-lease-time 600;
max-lease-time 6900;
```

### Soal 7

### Soal 8