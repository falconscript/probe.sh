
# Ping broadcast address in background
if [ `uname` = "Darwin" ] ; then
  bc_addr=`ifconfig |grep -w inet |grep -v 127.0.0.1|awk '{ print $6}'`
  ping -c 5 "$bc_addr" > /dev/null 2>&1 &
fi



parseProbes () {
 
  while  :; do
    read -r probe #;echo "$probe" # DEBUG

    strength=`echo "$probe" | grep -Eo "\-\d*dB"`
    bssidinfo=`echo "$probe" | grep -Eo "BSSID\:.*\)"`  #;echo "${#bssidinfo}" # DEBUG
    essid=`echo "$probe" | grep -Eo "\(.*\)"`
    SA=`echo "$probe" | grep -Eo "SA\:([a-fA-F0-9]{2}\:*){6}" | grep -Eo "([a-fA-F0-9]{2}\:*){6}$" ` 

    if [ "${#bssidinfo}" -gt 3 ] && [ "${#essid}" -gt 3 ]; then
      
      # Can we get IP/Hostname? From arpcache maybe
      if [ "${#SA}" -gt 3 ]; then
        MATCH=`arp -a 2>&1 | grep "$SA"`
      else
        MATCH=""
      fi

      echo -en "$essid\t SA $SA\t$strength" | tr '\n' ' '
      [ "${#MATCH}" -gt 2 ] && echo -en "\t    [+] MATCH FOR $essid - $MATCH"

      echo "" # newline at the END nowhere else!!
    fi

  done
}



# Nab probes
sudo tcpdump -i en0 -Inles 256 type mgt subtype probe-resp or subtype probe-req | parseProbes
