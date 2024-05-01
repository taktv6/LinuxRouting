#!/bin/bash

.PHONY: install start ospf bgp clean

install:
	sudo apt install bird2 terminator tcpdump mtr-tiny vim
	mkdir -p ~/.config/terminator
	cp .terminator_config ~/.config/terminator/config

start:
	/usr/bin/terminator -l LinuxRouting --working-directory ~

ospf:
	cp templates/ospf/R1/bird.conf R1/bird.conf
	cp templates/ospf/R2/bird.conf R2/bird.conf
	cp templates/ospf/R3/bird.conf R3/bird.conf
	cp templates/ospf/R4/bird.conf R4/bird.conf
	cp templates/ospf/R5/bird.conf R5/bird.conf
	cp templates/ospf/R6/bird.conf R6/bird.conf

bgp:
	cp templates/bgp/R1/bird.conf R1/bird.conf
	cp templates/bgp/R2/bird.conf R2/bird.conf
	cp templates/bgp/R3/bird.conf R3/bird.conf
	cp templates/bgp/R4/bird.conf R4/bird.conf
	cp templates/bgp/R5/bird.conf R5/bird.conf
	cp templates/bgp/R6/bird.conf R6/bird.conf

clean:
	rm R1/bird.conf
	rm R2/bird.conf
	rm R3/bird.conf
	rm R4/bird.conf
	rm R5/bird.conf
	rm R6/bird.conf
	sudo ./teardown.sh
