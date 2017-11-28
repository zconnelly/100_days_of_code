#!/usr/bin/env bash
set -e

# echo "number of lines in this file"
cat 001_head_tail_wc.bash | wc -l

# echo "get the first three lines"
cat 001_head_tail_wc.bash | head -n 3

# echo "get the last two lines"
cat 001_head_tail_wc.bash | tail -n 2

# echo "get the 9th line"
cat 001_head_tail_wc.bash | head -n 9 | tail -n 1

# echo "ask the user for which line they want and write it to a file"
read -p "which line do you want?: " line
cat 001_head_tail_wc.bash | head -n $line | tail -n 1 > requested_line.txt

# curl http://www.google.de and pipe it to vim
# curl http://www.google.de | vim -

# sed out the 13th line of this file
sed '13d' 001_head_tail_wc.bash
