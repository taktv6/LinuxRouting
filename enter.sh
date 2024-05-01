#!/bin/bash
export DEV=$1
sudo ip netns exec $DEV /bin/bash --rcfile /home/$USER/LinuxRouting/$DEV/.bashrc -c "cd /home/$USER/LinuxRouting/$DEV; bash --rcfile /home/$USER/LinuxRouting/$DEV/.bashrc"
