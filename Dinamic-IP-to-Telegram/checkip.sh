#!/bin/bash

Token="1234567890:ABCDEFGHIJKLMNOPQRSTUVWXYZ"
ChatID="1234567890"
LogIP="/tmp/public-ip.txt"

if [ ! -e "$LogIP" ] ; then
    touch "$LogIP"
fi

if [ ! -w "$LogIP" ] ; then
    echo cannot write to $LogIP
    exit 1
fi

CMD=("curl -s ifconfig.co" "curl -s icanhazip.com" "wget -qO- ipecho.net/plain | xargs echo" "wget -qO - icanhazip.com")
RND=$$$(date +%s)
CMD=${CMD[$RND % ${#CMD[@]}]}

IPOld=$(<$LogIP)
IPNew=$($CMD)

if [ "$IPOld" != "$IPNew" ]; then
  MSG="Your dynamic IP Address is changed to $IPNew"
  curl -s -X POST "https://api.telegram.org/bot$Token/sendMessage" -d "chat_id=$ChatID&text=$MSG"
  echo $IPNew > $LogIP
fi
