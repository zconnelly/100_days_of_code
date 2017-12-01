#!/usr/bin/env bash

# https://adventofcode.com/2017/day/1

set -e

SUM=0
LINE=$(cat input.txt)

for (( i=0; i<${#LINE}; i++ )); do
  j=$(( $i + 1))
  j=$(( $j % ${#LINE} ))
  C="${LINE:$i:1}"
  N="${LINE:$j:1}"
  if [ $C == $N ]; then
    SUM=$(( $SUM + $C ))
  fi
done

echo $SUM

SUM=0
LINE=$(cat input.txt)

for (( i=0; i<${#LINE}; i++ )); do
  j=$(( ( $i + ( ${#LINE} / 2)) % ${#LINE} ))
  C="${LINE:$i:1}"
  N="${LINE:$j:1}"
  if [ $C == $N ]; then
    SUM=$(( $SUM + $C ))
  fi
done

echo $SUM
