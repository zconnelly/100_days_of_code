#!/usr/bin/env bash

# https://adventofcode.com/2017/day/4

set -e

# part 1
count=$(cat 'input.txt' | wc -l)
while read line; do
  echo "$line" | sed -e 's/ /\'$'\n/g' | sort | uniq -c | grep -E "[2-9]" && count=$(( count - 1)) 
done < 'input.txt';

echo $count

# part 2
count=$(cat 'input.txt' | wc -l)
while read line; do
  IFS=' ' read -r -a words <<< "$line"
  for word in "${words[@]}"; do
    echo $word | grep -o . | sort | tr -d "\n"
    echo ""
  done | sort | uniq -c | grep -E "[2-9]" && count=$(( count -1 ))
done < 'input.txt';

echo $count
