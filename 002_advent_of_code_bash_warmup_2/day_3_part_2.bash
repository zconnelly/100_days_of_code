#!/usr/bin/env bash

set -e

# Answer to the problem found here ~~~in bash~~~ https://adventofcode.com/2016/day/2

valid() {
  [ $(($1 + $2)) -gt $3 ] && [ $(($2 + $3)) -gt $1 ] && [ $(( $3 + $1 )) -gt $2 ];
}

NUM_LINES=$(cat 'input_day_3.txt' | wc -l)
NUM_GROUPS=$(( $NUM_LINES / 3 ))
NUM=0

for (( i=1; i<=$NUM_GROUPS; i++ )); do
  if valid $(head -n $(( $i*3 )) 'input_day_3.txt' | tail -n 3 | tr -s ' ' | cut -d " " -f 2 | xargs); then
    NUM=$(( NUM + 1))
  fi
  if valid $(head -n $(( $i*3 )) 'input_day_3.txt' | tail -n 3 | tr -s ' ' | cut -d " " -f 3 | xargs); then
    NUM=$(( NUM + 1))
  fi
  if valid $(head -n $(( $i*3 )) 'input_day_3.txt' | tail -n 3 | tr -s ' ' | cut -d " " -f 4 | xargs); then
    NUM=$(( NUM + 1))
  fi
done

echo $NUM
