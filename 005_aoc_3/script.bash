#!/usr/bin/env bash

# https://adventofcode.com/2017/day/3

set -e

i=361527

# generate squares of odd numbers 
# until you get one bigger than the current number
n=-1
last=1
s=1
index=0


while [ $s -lt $i ]; do
  n=$(( $n + 2 ))
  last=$s
  s=$(( $n * $n ))
  index=$(( $index + 1))
done

c=$(( (($n - 1) / 2) - 1))
x=$(( $c + 1))
y=$c
y=$(( y - ($i - $last) + 1))

echo $x, $y
