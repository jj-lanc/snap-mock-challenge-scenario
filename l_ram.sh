#!/bin/bash
#CPU Script
source /home/prowess/Desktop/loadgen/scenarios/c
shuf -i $RAMLOWER-$RAMUPPER -n 1 | awk '{printf $1}'
