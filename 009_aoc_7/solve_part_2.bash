#!/usr/bin/env bash

# https://adventofcode.com/2017/day/7

set -e

declare -A m

while read line; do
  if [[ $line != *"->"* ]]; then
    name=$(echo $line | cut -d " " -f 1)
    weight=$(echo $line | cut -d "(" -f 2 | cut -d ")" -f 1)
    m[$name]=$weight
  fi
done < 'input.txt'

iter=0
while (( $iter < 1 )); do
  unset sums
  declare -a sums
  sumsi=0
  iter=$(( iter + 1))
  while read line; do
    unset prongs
    declare -a prongs
    if [[ $line == *"->"* ]]; then
      prongs=($(echo $line | sed 's/->/@/g' | cut -d "@" -f 2 | sed 's/,//g'))
      sum=0
      b=0
      for prong in ${prongs[@]}; do
        if [ "${m[$prong]}" == "" ]; then
          b=1
        else
          sum=$(( sum + ${m[$prong]} ))
        fi
      done
      if [ $b == 1 ]; then
        continue
      fi
      name=$(echo $line | cut -d " " -f 1)
      weight=$(echo $line | cut -d "(" -f 2 | cut -d ")" -f 1)
      if [ $sum != 0 ]; then
        sum=$(( sum + weight)) 
        sums[sumsi]=$sum
        sumsi=$(( sumsi + 1))
        m[$name]=$sum
      fi 
    fi
  done < 'input.txt'
done
