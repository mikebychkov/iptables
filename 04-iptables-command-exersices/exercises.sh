#!/bin/bash

#1
#Write the iptables commands that set the default POLICY to ACCEPT on INPUT and OUTPUT chains and DROP on FORWARD chain.

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP


#2
#Write the iptables command that lists only the filter table of INPUT chain. 

iptables -vnL -t filter INPUT


#3
#Write the iptables commands that list the nat table.

iptables -vnL -t nat


#4
#Write the iptables command that flushes the filter table of all chains.

iptables -F -t filter


#5
#Write an iptables rule that drops all incoming packets to port 22/tcp (ssh). This should be the first rule in the chain.

iptables -I INPUT -p tcp --dport 22 -j DROP


#6
#Write the iptables commands that flush all the tables of all chains and set the ACCEPT policy on all chains. This will delete any firewall.

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -F -t filter
iptables -F -t nat
iptables -F -t mangle
iptables -F -t raw

