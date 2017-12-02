#!/usr/bin/env bash

# https://adventofcode.com/2017/day/2

set -e

sum=0
while read line; do
  ar=($line)
  max=${ar[0]}
  min=${ar[0]}
  for n in "${ar[@]}"; do
    ((n > max)) && max=$n
    ((n < min)) && min=$n
  done
  sum=$(( sum + max - min ))
done < 'input.txt';

# echo $sum

sum=0
while read line; do
  ar=($line)
  a=0
  for i in "${ar[@]}"; do
    for j in "${ar[@]}"; do
      ((i % j == 0)) && !((i == j)) && a=$((i/j)) && sum=$(( sum + a))
    done
  done
done < 'input.txt';

echo $sum
