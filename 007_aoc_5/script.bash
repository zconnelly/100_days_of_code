#!/usr/bin/env bash

# https://adventofcode.com/2017/day/4

set -e

declare -a maze

i=0
while read line; do
  maze[$i]=$line
  i=$(( i + 1 ))
done < 'input.txt';

i=0
steps=0
while [ ! ${maze[$i]} == "" ]; do
  steps=$(( steps + 1 ))
  val=${maze[$i]}
  (( val > 2 )) && maze[$i]=$(( maze[$i] - 1 ))
  (( val < 3 )) && maze[$i]=$(( maze[$i] + 1 ))
  i=$(( i + val ))
done

echo $steps
