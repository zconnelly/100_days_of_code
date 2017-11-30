#!/usr/bin/env bash

set -e

# Answer to the problem found here ~~~in bash~~~ https://adventofcode.com/2016/day/2

valid() {
  [ $(($1 + $2)) -gt $3 ] && [ $(($2 + $3)) -gt $1 ] && [ $(( $3 + $1 )) -gt $2 ];
}

NUM=0
while read line; do
  if valid $line; then
    NUM=$(( $NUM + 1 ))
  fi
done < 'input_day_3.txt';

echo $NUM
