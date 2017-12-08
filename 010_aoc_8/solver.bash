#!/usr/env/bin bash

set -e

declare -A vars

while read line; do
  var=$(echo $line | cut -d " " -f 1)
  op=$(echo $line | cut -d " " -f 2)
  val=$(echo $line | cut -d " " -f 3)
  convar=$(echo $line | cut -d " " -f 5)
  con=$(echo $line | cut -d " " -f 6)
  conval=$(echo $line | cut -d " " -f 7)
  if [ $op == "inc" ]; then
    op="+"
  fi
  if [ $op == "dec" ]; then
    op="-"
  fi
  if [ $con == ">=" ]; then
    con="-ge"
  fi
  if [ $con == "<=" ]; then
    con="-le"
  fi
  if [ "${vars[$var]}" == "" ]; then
    vars[$var]=0
  fi
  if [ "${vars[$convar]}" == "" ]; then
    vars[$convar]=0
  fi
  if [ ${vars[$convar]} $con $conval ]; then
    vars[$var]=$(( ${vars[$var]} $op $val ))
  fi
done < 'input.txt'

max=-1000000
for i in ${vars[@]}; do
  (( $i > $max )) && max=$i
done

echo $max
echo ${vars[@]}
