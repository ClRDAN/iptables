#! /bin/bash
## Aitor Galilea@edt ASIX M11-SAO 2018-19
# IPTABLES zona desmilitarizada

# echo 1 > /proc/sys/ipv4/ip_forward

#reglas flush- vaciamos la tabla de reglas
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

#politicas por defecto
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#iptables -t nat -P PREROUTING REJECT
#iptables -t nat -P POSTROUTING REJECT

# abrir localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# abrir la IP propia
iptables -A INPUT -s 192.168.2.37 -j ACCEPT
iptables -A OUTPUT -d 192.168.2.37 -j ACCEPT

# abrir internet
#iptables -A INPUT -s 0.0.0.0/0 -j ACCEPT
#iptables -A OUTPUT -s 0.0.0.0/0 -j ACCEPT

# Desde el router solo se puede acceder a ssh y daytime de la red A
iptables -A OUTPUT -d 172.22.0.0/24 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -d 172.22.0.0/24 -p tcp --dport 13 -j ACCEPT
#iptables -A OUTPUT -d 172.22.0.0/24 -j DROP
iptables -A INPUT -s 172.22.0.0/24 -p tcp --sport 22 -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -s 172.22.0.0/24 -p tcp --sport 13 -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
#IPTABLES -A INPUT -s 172.22.0.0/24 -j DROP

# Desde la red A se puede acceder a cualquier SSH y Daytime, y al http de la DMZ
iptables -A FORWARD -s 172.22.0.0/24 -d 172.24.0.0/24 -p tcp --dport 22 -j REJECT
iptables -A FORWARD -s 172.22.0.0/24 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -d 172.22.0.0/24 -p tcp --sport 22 -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 172.22.0.0/24 -p tcp --dport 13 -j ACCEPT
iptables -A FORWARD -d 172.22.0.0/24 -p tcp --sport 22 -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 172.22.0.0/24 -d 172.24.0.2 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 172.22.0.0/24 -s 172.24.0.2 -p tcp --sport 80 -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
#iptables -A FORWARD -s 172.22.0.0/24 -j DROP

#iptables -t nat -A PREROUTING -s 172.22.0.0/24 -p tcp --dport 3002 -j DNAT --to 172.22.0.3:2013
#iptables -t nat -A PREROUTING -s 172.23.0.0/24 -p tcp --dport 3002 -j DNAT --to 172.22.0.3:2013

