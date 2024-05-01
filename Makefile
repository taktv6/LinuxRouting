#!/bin/bash

.PHONY: install start ospf bgp

install:
	sudo apt install bird2 terminator tcpdump mtr-tiny vim
	mkdir -p ~/.config/terminator
	cp .terminator_config ~/.config/terminator/config

start:
	/usr/bin/terminator -l LinuxRouting --working-directory ~

ospf:
	cp ospf/R1/bird.conf R1/bird.conf
	cp ospf/R2/bird.conf R2/bird.conf
	cp ospf/R3/bird.conf R3/bird.conf
	cp ospf/R4/bird.conf R4/bird.conf
	cp ospf/R5/bird.conf R5/bird.conf
	cp ospf/R6/bird.conf R6/bird.conf

bgp:
	cp bgp/R1/bird.conf R1/bird.conf
	cp bgp/R2/bird.conf R2/bird.conf
	cp bgp/R3/bird.conf R3/bird.conf
	cp bgp/R4/bird.conf R4/bird.conf
	cp bgp/R5/bird.conf R5/bird.conf
	cp bgp/R6/bird.conf R6/bird.conf
