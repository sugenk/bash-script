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

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

CMD=(
  "curl -s ifconfig.co"
  "curl -s ifconfig.me"
  "curl -s ipinfo.io/ip"
  "curl -s icanhazip.com"
  "curl -s ipv4.icanhazip.com"
  "curl -s ident.me"
  "curl -s v4.ident.me"
  "curl -s checkip.amazonaws.com"
  "wget -qO- ipecho.net/plain"
  "wget -qO- icanhazip.com"
  )

RND=$$$(date +%s)
CMD=${CMD[$RND % ${#CMD[@]}]}

IPOld=$(<$LogIP)
IPNew=$($CMD | xargs)

if valid_ip $IPNew; then 
  if [ "$IPOld" != "$IPNew" ]; then
    MSG="Your dynamic IP Address is changed to $IPNew"
    curl -s -X POST "https://api.telegram.org/bot$Token/sendMessage" -d "chat_id=$ChatID&text=$MSG"
    echo $IPNew > $LogIP
  fi
fi
