#!/bin/bash
iptables -F     #clear all previous rules

iptables -A INPUT -i lo -j ACCEPT	##允许回环设备
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT	##允许已建立的连接

iptables -A INPUT -p tcp --dport 80 -j ACCEPT       ##www
iptables -A INPUT -p tcp --dport 54321 -j ACCEPT    ##mysql
iptables -A INPUT -p tcp --dport 54322 -j ACCEPT    ##ssh
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT     ##other java server

##回应ping
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
#icmp_types="0 3 4 11 12 14 16 18"
#for icmp_type in $icmp_types
#do
#    iptables -A INPUT -p icmp --icmp-type $icmp_type -j ACCEPT
#done

##set policy
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

