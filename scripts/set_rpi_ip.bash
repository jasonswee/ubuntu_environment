#!/bin/bash
if [[ $# < 2 ]]; then
    echo Usage localrelay.bash [input port, output port]
    exit 1;
fi;
srcp=$1
dstp=$2
echo routing traffic from $srcp to $dstp. 
sysctl -w net.ipv4.ip_forward=1;
iptables -t nat -A POSTROUTING -o $dstp -j MASQUERADE
iptables -A FORWARD -i $dstp -o $srcp -m state -j ACCEPT --state RELATED,ESTABLISHED
iptables -A FORWARD -i $srcp -o $dstp -j ACCEPT
udhcpd -f -I 192.168.0.8
