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
  DISTANCE=${line:1};
  if [ $CHANGE == 'R' ]; then
    DIRECTION=$(( $DIRECTION + 1 ))
  else
    DIRECTION=$(( $DIRECTION - 1 ))
  fi
  DIRECTION=$(( ($DIRECTION + 4) % 4 ))
  if [ $DIRECTION == 0 ]; then
    Y=$(( Y + $DISTANCE ))
  elif [ $DIRECTION == 1 ]; then
    X=$(( X + $DISTANCE ))
  elif [ $DIRECTION == 2 ]; then
    Y=$(( Y - $DISTANCE ))
  elif [ $DIRECTION == 3 ]; then
    X=$(( X - $DISTANCE ))
  fi
done < 'input.txt';

if [ $X -lt 0 ]; then
  X=$(( 0-$X ));
fi

if [ $Y -lt 0 ]; then
  Y=$(( 0-$Y ));
fi

echo $(( $X + $Y ))

# part 2

echo "0, 0" > 'steps.txt'

X=0
Y=0

DIRECTION=0

while read line; do
  CHANGE=${line:0:1};
  DISTANCE=${line:1};
  if [ $CHANGE == 'R' ]; then
    DIRECTION=$(( $DIRECTION + 1 ))
  else
    DIRECTION=$(( $DIRECTION - 1 ))
  fi
  DIRECTION=$(( ($DIRECTION + 4) % 4 ))
  if [ $DIRECTION == 0 ]; then
    for i in $(seq 1 $DISTANCE); do
      Y=$(( Y + 1 ))
      echo $X, $Y >> 'steps.txt';
    done;
  elif [ $DIRECTION == 1 ]; then
    for i in $(seq 1 $DISTANCE); do
      X=$(( X + 1 ))
      echo $X, $Y >> 'steps.txt';
    done;
  elif [ $DIRECTION == 2 ]; then
    for i in $(seq 1 $DISTANCE); do
      Y=$(( Y - 1 ))
      echo $X, $Y >> 'steps.txt';
    done;
  elif [ $DIRECTION == 3 ]; then
    for i in $(seq 1 $DISTANCE); do
      X=$(( X - 1 ))
      echo $X, $Y >> 'steps.txt';
    done;
  fi
done < 'input.txt';

COUNTER=-1
while read line; do
  COUNTER=$(( $COUNTER + 1 ))
  if [ $COUNTER == 0 ]; then
    continue;
  fi
  if cat 'steps.txt' | head -n $COUNTER | grep -- "^$line$"; then
    echo $line
    break;
  fi
done < 'steps.txt';
