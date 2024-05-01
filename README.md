# LinuxRouting

This is the repository hosting resources used in the Linux Hotel Dynamic Routing Training
hosted by Oliver 'takt' Geiselhardt-Herms.

## Concept

The concept of the training session is to use Linux network namespaces to create virtual routers
that are interconnected using virtual ethernet devices (veth). The repository contains a script
setup.sh that is used to create all namespaces, interfaces and IP assignments. It must be run with
CAP_NET_ADMIN privileges or as user root.

A terminator config is prepared to launch a common setup containing prepared shells for each virtual router.

## Setup
```
make setup
```
Will call the setup.sh script to instantiate the lab environment and install commonly needed debian packages.
It will also copy the terminator config to ~/.config/terminator/config.

## Running the lab
```
make start
```
Will start a terminator window containing two tabs (one for the routers, one for server (S) and client (C)).
You will be asked for your sudo password to start the shells of the routers in their respective network namespace.
Inside these terminals the `bird` and `birdc` commands are aliases so that you don't need to worry about
specifying the correct config and socket files. BIRDs config and socket files are kept in the folders
named after the routers/devices they belong to.