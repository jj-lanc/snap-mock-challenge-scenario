#!/bin/bash
#CPU Script
source /home/prowess/Desktop/loadgen/scenarios/c
shuf -i $CPULOWER-$CPUUPPER -n 1 | awk '{printf $1}'
