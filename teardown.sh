#!/bin/bash

killall bird
ip netns del R1
ip netns del R2
ip netns del R3
ip netns del R4
ip netns del R5
ip netns del R6
ip netns del C
ip netns del S
ip netns del LANA
ip netns del LANB
