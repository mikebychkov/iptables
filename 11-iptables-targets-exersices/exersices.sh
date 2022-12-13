#!/bin/bash

#1
#Write the iptables commands that display the help for REJECT and LOG targets.

iptables -j REJECT --help
iptables -j LOG --help


#2
#Write an iptables rule that REJECTS all incoming packets to port tcp/25 and sends back to the source a tcp-reset packet.

iptables -I INPUT -p tcp --dport 25 -j REJECT --reject-with tcp-reset


#3
#Write the iptables rules that log and then REJECT the headers of all incoming SSH (tcp/22) packets. Prefix each log line with: ssh in:
#Generate incoming ssh traffic and display the logs. Filter the logs by log prefix.

iptables -A INPUT -p tcp --dport 22 --syn -j LOG --log-prefix="ssh in"


#4
#Change the solution of Challenge #3 and LOG only the first packet of the connection (syn bit set). Deny all packets.

#...
iptables -A INPUT -p tcp --dport 22 --syn -j DROP


#5
#Change the solution of Challenge #4 and LOG at most 1 packet per second. Deny all packets.

iptables -A INPUT -p tcp --dport 22 --syn -m limit 1/s -j LOG --log-prefix="ssh in"
iptables -A INPUT -p tcp --dport 22 --syn -j DROP


#6
#Using the netstat command list all open ports and established connections (sockets)  of both TCP and UDP protocols both on Linux and Windows.

netstat -tulpan


#7
#Using nmap scan ports 22,25,80 and 443 on 10.0.0.1 (replace it with an IP from you Network).

nmap -p 22,25,80,443 192.168.0.116


#8
#Using nmap scan ports 22,25,80 and 443 and service versions on 10.0.0.1 (replace it with an IP from you Network).

sudo nmap -sV -p 22,25,80,443 192.168.0.116


#9
#You want to mirror all TCP traffic that arrives at 10.0.0.10 to 10.0.0.1.
#What iptables rule on 10.0.0.10 accomplishes that?

iptables -A INPUT -p tcp -j TEE --gateway 10.0.0.1


#10
#You want to redirect incoming TCP traffic to port 80 to port 8080 on the same host where a Proxy is running.
#What iptables rule accomplishes that? 

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080


