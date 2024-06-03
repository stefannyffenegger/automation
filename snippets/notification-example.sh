#!/bin/bash
# simple notification to webhook example
# author: SN
# sends notifications to a messenger webhook
# examples: telegram, line

# telegram API token and chat ID
TELEGRAM_API_TOKEN="[API_TOKEN]" # get from 'botfather'
TELEGRAM_CHAT_ID="[CHAT_ID]" # get from 'IDBot', include '-' with group chat ID's
# line access token
LINE_ACCESS_TOKEN="[ACCESS_TOKEN]" # create access token here https://notify-bot.line.me/my/
# preset messages
MESSAGE=$'Hello World!'

# send to telegram
curl -s -X POST https://api.telegram.org/bot$TELEGRAM_API_TOKEN/sendMessage -d chat_id=$TELEGRAM_CHAT_ID -d text="$MESSAGE"
# send to line
curl -X POST -H "Authorization: Bearer ""$LINE_ACCESS_TOKEN" -F 'message='"$MESSAGE" https://notify-api.line.me/api/notify