#!/bin/bash

install:
	sudo apt install bird2 terminator tcpdump mtr-tiny vim
	mkdir -p ~/.config/terminator
	cp .terminator_config ~/.config/terminator/config

start:
	/usr/bin/terminator -l LinuxRouting --working-directory ~