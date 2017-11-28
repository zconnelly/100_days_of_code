#!/usr/bin/env bash

# Used this to send me a random word in german every hour.
# below is the associated cron
#
# 30 * * * *  cd ~/redacted/redacted/redacted && ./this_script.bash
#

set -e

NUM_LINES=$(cat todo.txt | wc -l)
RANDOM_LINE_NUM=$(($RANDOM % $NUM_LINES))
RANDOM_LINE=$(cat todo.txt | head -n $RANDOM_LINE_NUM | tail -n 1)

curl -X POST --data-urlencode "payload={\"username\": \"German Time\", \"text\": \"\`\`\`\n$RANDOM_LINE\n\`\`\`\", \"icon_emoji\": \":flag-de:\"}" https://hooks.slack.com/services/[REDACTED]

sed -i.bak -e $RANDOM_LINE_NUM'd' todo.txt
