#!/usr/bin/env bash

# https://adventofcode.com/2017/day/6

set -e

declare -a memory=( 14 0 15 12 11 11 3 5 1 6 8 4 9 1 8 4 )
declare -A known

i=0
fin=0
sec=0
while (( $fin == 0 )); do
  # save state
  known["${memory[*]}"]=1

  # determine max
  m=${memory[0]}
  in=0
  for j in ${!memory[@]}; do
    val=${memory[$j]}
    (( $m < $val )) && m=$val && in=$j
  done

  # distribute
  memory[$in]=0
  len=${#memory[@]}
  while (( $m > 0 )); do
    in=$(( ($in + 1) % $len ))
    val=${memory[$in]}
    memory[$in]=$(( ${memory[$in]} + 1 ))
    m=$(( $m - 1))
  done;

  if [ ${known["${memory[*]}"]} ]; then
    if [ $sec == 1 ]; then
      fin=1
    fi
  fi

  if [ ${known["${memory[*]}"]} ]; then
    if [ $sec == 0 ]; then
      unset known
      declare -A known
      known["${memory[*]}"]=1
      i=-1
      sec=1
    fi
  fi

  i=$(( $i + 1 ))
done

echo $i
