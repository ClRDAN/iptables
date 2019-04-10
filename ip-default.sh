#! /bin/bash
## Aitor Galilea@edt ASIX M11-SAO 2018-19
# IPTABLES

# echo 1 > /proc/sys/ipv4/ip_forward

#reglas flush- vaciamos la tabla de reglas
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

#politicas por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT

# abrir localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# abrir la IP propia
iptables -A INPUT -s 192.168.2.37 -j ACCEPT
iptables -A OUTPUT -d 192.168.2.37 -j ACCEPT

# 


