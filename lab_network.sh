#!/bin/bash

### 
### Lab Server Network Loading commands and details
### @slackspider, August 2014
###


#ifconfig enp4s5 192.168.1.15 netmask 255.255.255.0
#ifconfig enp4s6 192.168.0.15 netmask 255.255.255.0
#ifconfig enp6s0 172.16.1.10 netmask 255.255.255.0

# Setup Static IP Address
ifconfig enp4s5 172.16.1.10 netmask 255.255.255.0

# Start Samba for file sharing with other machines
start smbd
start nmbd

# Start Squid Web proxy for Internet Control / Security
start squid3

# Start DNS server
# /etc/init.d/bind9 start
service bind9 start


# Start DHCP server
dhcpd enp6s0

# Configure the Server to use its own IP as DNS Server
# Pesky ISP keeps changing all the time
echo "nameserver 172.16.1.10" >> /etc/resolv.conf

# Loads Firewall Rules
/etc/rc.firewall

