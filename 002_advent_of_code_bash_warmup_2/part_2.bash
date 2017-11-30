#!/usr/bin/env bash

set -e

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

RES="${MAP[1, 3]}"

if [ "$RES" == '' ]; then
  echo "foo";
else
  echo "bar";
fi
