#!/usr/bin/env bash

# https://adventofcode.com/2017/day/7

set -e

lefties() {
  cat input.txt | sed 's/->/@/g' | cut -d "@" -f 1 | cut -d " " -f 1 | sort
}

righties() {
  cat input.txt | sed 's/->/@/g' | grep "@" | cut -d "@" -f 2 | sed 's/,/ /g' | xargs | sed -e 's/ /\'$'\n/g' | sort
}

diff <(lefties) <(righties)
