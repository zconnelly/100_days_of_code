#!/usr/bin/env bash

# Answer to the problem found here ~~~in bash~~~ https://adventofcode.com/2016/day/2

X=0
Y=2

# map 123
#     456
#     789
# to the coordinates
declare -A MAP
MAP["0, 2"]=5
MAP["1, 1"]='A' 
MAP["1, 2"]=6 
MAP["1, 3"]=2
MAP["2, 0"]='D' 
MAP["2, 1"]='B' 
MAP["2, 2"]=7
MAP["2, 3"]=3 
MAP["2, 4"]=1
MAP["3, 1"]='C' 
MAP["3, 2"]=8 
MAP["3, 3"]=4
MAP["4, 2"]=9

while read line; do
  for (( i=0; i<${#line}; i++ )); do
    DIR="${line:$i:1}"
    if [ $DIR == 'U' ] && [ ! "${MAP[$X, $(( Y + 1))]}" == '' ]; then
      Y=$(( Y + 1 ))
    elif [ $DIR == 'D' ] && [ ! "${MAP[$X, $(( Y - 1))]}" == '' ]; then
      Y=$(( Y - 1 ))
    elif [ $DIR == 'R' ] && [ ! "${MAP[$(( X + 1)), $Y]}" == '' ]; then
      X=$(( X + 1))
    elif [ $DIR == 'L' ] && [ ! "${MAP[$(( X - 1)), $Y]}" == '' ]; then
      X=$(( X - 1))
    fi 
  done
  SPACE="$X, $Y"
  echo "${MAP[$SPACE]}"
done < 'input.txt';
