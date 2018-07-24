#!/bin/bash

Token="1234567890:ABCDEFGHIJKLMNOPQRSTUVWXYZ"
ChatID="1234567890"
LogIP="/tmp/public-ip.txt"

IPOld=$(<$LogIP)
IPNew=$(curl -s https://ifconfig.co)

#if [ "$IPOld" = "$IPNew" ]; then
#  MSG="Your dinamic IP is not changed $IPOld = $IPNew"
#else
#  MSG="Your dinamic IP is changed to $IPNew"
#  echo $IPNew > $LogIP
#fi

if [ "$IPOld" != "$IPNew" ]; then
  MSG="Your dinamic IP is changed to $IPNew"
  echo $IPNew > $LogIP
fi

curl -s -X POST "https://api.telegram.org/bot$Token/sendMessage" -d "chat_id=$ChatID&text=$MSG"
