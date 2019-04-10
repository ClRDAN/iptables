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
#abrir el puerto 80 a todo el mundo
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#cerramos puertos 2080 y 3080 a todos 
iptables -A INPUT -p tcp --dport 2080 -j DROP
iptables -A INPUT -ptcp --dport 3080 -j REJECT
#todos no pero uno si acceden al 4080
iptables -A INPUT -s 192.168.2.56 -p tcp --dport 4080 -j ACCEPT
iptables -A INPUT -p tcp --dport 4080 -j DROP
#
iptables -A INPUT -p tcp --dport 4080 -s 192.168.2.56 -j REJECT
iptables -A INPUT -p tcp --dport 4080 -s 192.168.2.26 -j ACCEPT
# PORT 5080 cerramos a todos, abierto a hisx2, cerrado a i26
iptables -A INPUT -p tcp --dport 5080 -s 192.168.2.56 -j REJECT
iptables -A INPUT -p tcp --dport 5080 -s 192.168.2.0/24 -j ACCEPT
iptables -A INPUT -p tcp --dport 5080 -j REJECT

