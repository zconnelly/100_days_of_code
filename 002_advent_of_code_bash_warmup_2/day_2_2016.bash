#!/usr/bin/env bash

# Answer to the problem found here ~~~in bash~~~ https://adventofcode.com/2016/day/2

X=1
Y=1

# map 123
#     456
#     789
# to the coordinates
declare -A MAP
MAP["0, 0"]=7 
MAP["0, 1"]=4 
MAP["0, 2"]=1
MAP["1, 0"]=8 
MAP["1, 1"]=5 
MAP["1, 2"]=2
MAP["2, 0"]=9 
MAP["2, 1"]=6 
MAP["2, 2"]=3

while read line; do
  for (( i=0; i<${#line}; i++ )); do
    DIR="${line:$i:1}"
    if [ $DIR == 'U' ]; then
      Y=$(( Y + 1 ))
    elif [ $DIR == 'D' ]; then
      Y=$(( Y - 1 ))
    elif [ $DIR == 'R' ]; then
      X=$(( X + 1))
    elif [ $DIR == 'L' ]; then
      X=$(( X - 1))
    fi 

    if [ $Y -lt 0 ]; then
      Y=0
    fi
    if [ $Y -gt 2 ]; then
      Y=2
    fi
    if [ $X -lt 0 ]; then
      X=0
    fi
    if [ $X -gt 2 ]; then
      X=2
    fi
  done
  SPACE="$X, $Y"
  echo "${MAP[$SPACE]}"
done < 'input.txt';
