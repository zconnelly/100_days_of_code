#!/usr/bin/env bash

# Answer to the problem found here ~~~in bash~~~ https://adventofcode.com/2016/day/1
# Note: I used vim to format the input -- each "turn" is on a newline
# finds the solution in a system time of 2ms 

set -e

X=0
Y=0

DIRECTION=0

while read line; do
  CHANGE=${line:0:1};
  DISTANCE=${line:1:56};
  if [ $CHANGE == 'R' ]; then
    DIRECTION=$(( $DIRECTION + 1 ))
  else
    DIRECTION=$(( $DIRECTION - 1 ))
  fi
  DIRECTION=$(( ($DIRECTION + 4) % 4 ))
  if [ $DIRECTION == 0 ]; then
    Y=$(( Y + $DISTANCE ))
  fi
  if [ $DIRECTION == 1 ]; then
    X=$(( X + $DISTANCE ))
  fi
  if [ $DIRECTION == 2 ]; then
    Y=$(( Y - $DISTANCE ))
  fi
  if [ $DIRECTION == 3 ]; then
    X=$(( X - $DISTANCE ))
  fi
done < 'input.txt';

X=$(( 0-$X ))
Y=$(( 0-$Y ))

if [ $X -lt 0 ]; then
  X=$(( 0-$X ));
fi

if [ $Y -lt 0 ]; then
  Y=$(( 0-$Y ));
fi

echo $(( $X + $Y ))
