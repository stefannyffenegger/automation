#!/bin/bash
# simple borg notification example
# author: SN
# sends a notification to line if the last borg backup is older than n days
# needs to be run by e.g. daily cronjob

BORG_REPO_DIR="[REPOSITORY_DIR]"
MAX_DAYS=2

# notification setup
# sends notifications to line webhook
# create access token here https://notify-bot.line.me/my/
LINE_ACCESS_TOKEN="[LINE_ACCESS_TOKEN]"
# preset message
MSG_FAIL=$'Borg Backup Check:\nThe last Borg backup is older than '

echo "INFO: get date of last borg backup"
backup_last=sudo borg list --consider-checkpoints --last 1 --format '{end}' "$BORG_REPO_DIR"

echo -e "\nINFO: comparing dates..."
let time_since=($(date +%s)-$(date +%s -d "$backup_last"))/86400
echo "INFO: days since last backup: "$time_since

if (( $time_since > $MAX_DAYS ))
then
  echo "INFO: sending notification because last backup is older than n days"
  curl -X POST -H "Authorization: Bearer ""$LINE_ACCESS_TOKEN" -F 'message='"$MSG_FAIL""$time_since"" days! Please check the backup system for issues" https://notify-api.line.me/api/notify
fi