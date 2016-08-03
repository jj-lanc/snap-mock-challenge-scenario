#!/bin/bash
cpu="$(./l_cpu.sh)"
disk="$(./l_disk.sh)"
ram="$(./l_ram.sh)"
net="$(./l_net.sh)"

echo Sample Output:
echo
echo CPU: $cpu
echo DISK: $disk
echo RAM: $ram
echo NETWORK: $net
echo
