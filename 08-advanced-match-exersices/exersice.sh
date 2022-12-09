#1
#Run the iptables commands the list the help of:
#a) -m time match
#b) -m mac match
#c) -m limit match

iptables -m time --help
iptables -m mac --help
iptables -m limit --help


#2
#Create a firewall script for your Laptop what runs Linux. All outgoing traffic is allowed but only the return incoming traffic is permitted. No services are running on the laptop.

iptables -F

iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


#3
#allow the loopback interface traffic (lo)
#drop invalid packets

iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

iptables -I INPUT -m state --state INVALID -j DROP
iptables -I OUTPUT -m state --state INVALID -j DROP


#4
#You start the SSH Daemon on your laptop and want to allow incoming SSH connections (tcp/22) only from your work (IP address: 100.0.0.1).
#Add the appropriate iptables rule.

iptables -A INPUT -p tcp --dport 22 --syn -s 100.0.0.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 --syn -j DROP


#5
#The MAC Address of the LAN Router is b4:6d:83:77:85:f5
#Write a single iptables rule that allows the communication of your Linux host only with the router. It cannot communicate with other hosts inside the same LAN. Do not modify the policy.

iptables -A INPUT -m mac ! --mac-sorce "b4:6d:83:77:85:f5" -j DROP


#6
#You have a LAN with a server and 5 hosts. The MAC addresses of the hosts are: b4:6d:83:77:85:f1 b4:6d:83:77:85:f2 b4:6d:83:77:85:f3 b4:6d:83:77:85:f4 b4:6d:83:77:85:f5
#Write an iptables script on the server that allows only the communication with those 5 hosts. No other host is allowed to communicate with the server.

HOSTS="b4:6d:83:77:85:f1 b4:6d:83:77:85:f2 b4:6d:83:77:85:f3 b4:6d:83:77:85:f4 b4:6d:83:77:85:f5"

for HOST in $HOSTS
do
	iptables -A INPUT -m mac --mac-source $HOST -j ACCEPT
done

iptables -P INPUT DROP


#7
#Write the iptables rules that permit outgoing web traffic (tcp ports 80 and 443) only between 10:00 and 18:00 UTC.

iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m time --timestart 10:00 --timestop 18:00 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -j DROP


#8
#Consider Challenge #7. Add a match to allow web traffic only on the weekend between 10:00 and 18:00 UTC.

iptables -I OUTPUT -p tcp -m multiport --dports 80,443 -m time ! --weekdays Sat,Sun -j DROP


#9
#Write the iptables rules that permit only 2 incoming ICMP echo-request (ping) packets per second from any IP address.

iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 2/s -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP


#10
#Write an iptables rule that permits only 10 NEW TCP connections from the same IP address.

iptables -A INPUT -p tcp --syn -m connlimit --connlimit-above 10 -j DROP

