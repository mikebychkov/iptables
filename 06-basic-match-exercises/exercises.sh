#!/bin/bash

#1
#Write the iptables rules that drop all incoming packets from 100.0.0.1 and 1.2.3.4 and all outgoing packets to 80.0.0.1
#These will be the first rules in the chains.

iptables -I INPUT -s 100.0.0.1 -j DROP
iptables -I INPUT -s 1.2.3.4 -j DROP
iptables -I OUTPUT -d 80.0.0.1 -j DROP


#2
#Write the iptables rules that drop all outgoing generated packets of type tcp (port 80 and 443) to www.linuxquestions.org

iptables -I OUTPUT -p tcp -d www.linuxquestions.org -m multiport --dports 80,443 -j DROP


#3
#Write the iptables rules that drop all outgoing packets of type tcp (port 80 and 443) to www.linuxquestions.org
#The Linux machine is the router.

iptables -I FORWARD -p tcp -d www.linuxquestions.org -m multiport --dports 80,443 -j DROP


#4
#Write an iptables rule that drops all incoming packets from network 27.103.0.0 255.255.0.0
#This will be the first rule in the chain.

iptables -I INPUT -s 27.103.0.0/16 -j DROP


#5
#The DNS Server of your LAN is set to 8.8.8.8. You don't want to allow the users of the LAN to change the DNS server.
#Write an iptables rule in order to drop all UDP packets to port 53 (DNS) if they are destined to another IP address (not to 8.8.8.8). The Linux Machine is the Router.

iptables -A FORWARD -p udp ! -d 8.8.8.8 --dport 53 -j DROP


#6
#Write the iptables rules that allow all traffic of the loopback (lo) interface.

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


#7
#Your Linux Machine is the router. The internal interface is called eth0 and the external interface is called eth1.
#Write the iptables rules that allow establishing incoming ssh (tcp/22) connections only from the LAN.

iptables -I INPUT -p tcp ! -i eth0 --dport 22 -j DROP

#or

iptables -A FORWARD -p tcp --dport 22 --syn -i eth0 -j ACCEPT
iptables -A FORWARD -p tcp --dport 22 --syn -i eth1 -j DROP

