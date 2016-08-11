#!/bin/bash

#set random boundary variables based on local filename
name=$(basename $0)
upn=${name/%???/};upn+=u
lon=${name/%???/};lon+=l
source /home/user/Desktop/loadgen/scenarios/c
eval up=\$$upn
eval lo=\$$lon

#generate value
n=$(shuf -i $lo-$up -n 1)

echo -n $n

