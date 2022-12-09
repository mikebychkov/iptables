#1
#Run the iptables commands the list the help of:
#a) -m time match
#b) -m mac match
#c) -m limit match



#2
#Create a firewall script for your Laptop what runs Linux. All outgoing traffic is allowed but only the return incoming traffic is permitted. No services are running on the laptop.



#3
#Consider Challenge #2. Make sure that you also:
#- allow the loopback interface traffic (lo)
#- drop invalid packets
#- flush the firewall at the beginning of the script



#4
#Consider Challenge #3.
#You start the SSH Daemon on your laptop and want to allow incoming SSH connections (tcp/22) only from your work (IP address: 100.0.0.1).
#Add the appropriate iptables rule.



#5
#The MAC Address of the LAN Router is b4:6d:83:77:85:f5
#Write a single iptables rule that allows the communication of your Linux host only with the router. It cannot communicate with other hosts inside the same LAN. Do not modify the policy.



#6
#You have a LAN with a server and 5 hosts. The MAC addresses of the hosts are: b4:6d:83:77:85:f1 b4:6d:83:77:85:f2 b4:6d:83:77:85:f3 b4:6d:83:77:85:f4 b4:6d:83:77:85:f5
#Write an iptables script on the server that allows only the communication with those 5 hosts. No other host is allowed to communicate with the server.



#7
#Write the iptables rules that permit outgoing web traffic (tcp ports 80 and 443) only between 10:00 and 18:00 UTC.



#8
#Consider Challenge #7. Add a match to allow web traffic only on the weekend between 10:00 and 18:00 UTC.



#9
#Write the iptables rules that permit only 2 incoming ICMP echo-request (ping) packets per second from any IP address.



#10
#Write an iptables rule that permits only 10 NEW TCP connections from the same IP address.

