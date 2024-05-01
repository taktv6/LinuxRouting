#!/bin/sh -eux
ip netns add LANA
mkdir -p lab1/LANA
ip netns exec LANA ip link add name br0 type bridge
ip netns exec LANA ip link set up dev br0
ip netns add LANB
mkdir -p lab1/LANB
ip netns exec LANB ip link add name br0 type bridge
ip netns exec LANB ip link set up dev br0
ip netns add S
mkdir -p lab1/S
ip netns exec S bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec S bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add C
mkdir -p lab1/C
ip netns exec C bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec C bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R1
mkdir -p lab1/R1
ip netns exec R1 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R1 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R2
mkdir -p lab1/R2
ip netns exec R2 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R2 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R3
mkdir -p lab1/R3
ip netns exec R3 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R3 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R4
mkdir -p lab1/R4
ip netns exec R4 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R4 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R5
mkdir -p lab1/R5
ip netns exec R5 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R5 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip netns add R6
mkdir -p lab1/R6
ip netns exec R6 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 1 > ${i}/forwarding; done'
ip netns exec R6 bash -c 'for i in /proc/sys/net/ipv4/conf/*; do echo 0 > ${i}/rp_filter; done'
ip link add S-LANA type veth peer name LANA-S
ip link set S-LANA netns S
ip netns exec S ip link set up dev S-LANA
ip link set LANA-S netns LANA
ip netns exec LANA ip link set up dev LANA-S
ip netns exec LANA ip link set LANA-S master br0
ip netns exec S ip addr add 192.168.100.100/24 dev S-LANA
ip link add R1-LANA type veth peer name LANA-R1
ip link set R1-LANA netns R1
ip netns exec R1 ip link set up dev R1-LANA
ip link set LANA-R1 netns LANA
ip netns exec LANA ip link set up dev LANA-R1
ip netns exec LANA ip link set LANA-R1 master br0
ip netns exec R1 ip addr add 192.168.100.1/24 dev R1-LANA
ip link add R2-LANA type veth peer name LANA-R2
ip link set R2-LANA netns R2
ip netns exec R2 ip link set up dev R2-LANA
ip link set LANA-R2 netns LANA
ip netns exec LANA ip link set up dev LANA-R2
ip netns exec LANA ip link set LANA-R2 master br0
ip netns exec R2 ip addr add 192.168.100.2/24 dev R2-LANA
ip link add R1-R2 type veth peer name R2-R1
ip link set R1-R2 netns R1
ip netns exec R1 ip link set up dev R1-R2
ip link set R2-R1 netns R2
ip netns exec R2 ip link set up dev R2-R1
ip netns exec R1 ip addr add 192.168.1.0/31 dev R1-R2
ip netns exec R2 ip addr add 192.168.1.1/31 dev R2-R1
ip link add R1-R3 type veth peer name R3-R1
ip link set R1-R3 netns R1
ip netns exec R1 ip link set up dev R1-R3
ip link set R3-R1 netns R3
ip netns exec R3 ip link set up dev R3-R1
ip netns exec R1 ip addr add 192.168.2.0/31 dev R1-R3
ip netns exec R3 ip addr add 192.168.2.1/31 dev R3-R1
ip link add R2-R4 type veth peer name R4-R2
ip link set R2-R4 netns R2
ip netns exec R2 ip link set up dev R2-R4
ip link set R4-R2 netns R4
ip netns exec R4 ip link set up dev R4-R2
ip netns exec R2 ip addr add 192.168.3.0/31 dev R2-R4
ip netns exec R4 ip addr add 192.168.3.1/31 dev R4-R2
ip link add R1-R4 type veth peer name R4-R1
ip link set R1-R4 netns R1
ip netns exec R1 ip link set up dev R1-R4
ip link set R4-R1 netns R4
ip netns exec R4 ip link set up dev R4-R1
ip netns exec R1 ip addr add 192.168.4.0/31 dev R1-R4
ip netns exec R4 ip addr add 192.168.4.1/31 dev R4-R1
ip link add R2-R3 type veth peer name R3-R2
ip link set R2-R3 netns R2
ip netns exec R2 ip link set up dev R2-R3
ip link set R3-R2 netns R3
ip netns exec R3 ip link set up dev R3-R2
ip netns exec R2 ip addr add 192.168.5.0/31 dev R2-R3
ip netns exec R3 ip addr add 192.168.5.1/31 dev R3-R2
ip link add R3-R5 type veth peer name R5-R3
ip link set R3-R5 netns R3
ip netns exec R3 ip link set up dev R3-R5
ip link set R5-R3 netns R5
ip netns exec R5 ip link set up dev R5-R3
ip netns exec R3 ip addr add 192.168.6.0/31 dev R3-R5
ip netns exec R5 ip addr add 192.168.6.1/31 dev R5-R3
ip link add R4-R6 type veth peer name R6-R4
ip link set R4-R6 netns R4
ip netns exec R4 ip link set up dev R4-R6
ip link set R6-R4 netns R6
ip netns exec R6 ip link set up dev R6-R4
ip netns exec R4 ip addr add 192.168.7.0/31 dev R4-R6
ip netns exec R6 ip addr add 192.168.7.1/31 dev R6-R4
ip link add R3-R6 type veth peer name R6-R3
ip link set R3-R6 netns R3
ip netns exec R3 ip link set up dev R3-R6
ip link set R6-R3 netns R6
ip netns exec R6 ip link set up dev R6-R3
ip netns exec R3 ip addr add 192.168.8.0/31 dev R3-R6
ip netns exec R6 ip addr add 192.168.8.1/31 dev R6-R3
ip link add R4-R5 type veth peer name R5-R4
ip link set R4-R5 netns R4
ip netns exec R4 ip link set up dev R4-R5
ip link set R5-R4 netns R5
ip netns exec R5 ip link set up dev R5-R4
ip netns exec R4 ip addr add 192.168.9.0/31 dev R4-R5
ip netns exec R5 ip addr add 192.168.9.1/31 dev R5-R4
ip link add R5-R6 type veth peer name R6-R5
ip link set R5-R6 netns R5
ip netns exec R5 ip link set up dev R5-R6
ip link set R6-R5 netns R6
ip netns exec R6 ip link set up dev R6-R5
ip netns exec R5 ip addr add 192.168.10.0/31 dev R5-R6
ip netns exec R6 ip addr add 192.168.10.1/31 dev R6-R5
ip link add C-LANB type veth peer name LANB-C
ip link set C-LANB netns C
ip netns exec C ip link set up dev C-LANB
ip link set LANB-C netns LANB
ip netns exec LANB ip link set up dev LANB-C
ip netns exec LANB ip link set LANB-C master br0
ip netns exec C ip addr add 192.168.200.100/24 dev C-LANB
ip link add R5-LANB type veth peer name LANB-R5
ip link set R5-LANB netns R5
ip netns exec R5 ip link set up dev R5-LANB
ip link set LANB-R5 netns LANB
ip netns exec LANB ip link set up dev LANB-R5
ip netns exec LANB ip link set LANB-R5 master br0
ip netns exec R5 ip addr add 192.168.200.1/24 dev R5-LANB
ip link add R6-LANB type veth peer name LANB-R6
ip link set R6-LANB netns R6
ip netns exec R6 ip link set up dev R6-LANB
ip link set LANB-R6 netns LANB
ip netns exec LANB ip link set up dev LANB-R6
ip netns exec LANB ip link set LANB-R6 master br0
ip netns exec R6 ip addr add 192.168.200.2/24 dev R6-LANB

ip netns exec R1 ip link set up dev lo
ip netns exec R1 ip addr add 192.168.0.1/32 dev lo
ip netns exec R2 ip link set up dev lo
ip netns exec R2 ip addr add 192.168.0.2/32 dev lo
ip netns exec R3 ip link set up dev lo
ip netns exec R3 ip addr add 192.168.0.3/32 dev lo
ip netns exec R4 ip link set up dev lo
ip netns exec R4 ip addr add 192.168.0.4/32 dev lo
ip netns exec R5 ip link set up dev lo
ip netns exec R5 ip addr add 192.168.128.5/32 dev lo
ip netns exec R6 ip link set up dev lo
ip netns exec R6 ip addr add 192.168.128.6/32 dev lo