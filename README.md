# probe.sh
Capture 802.11 WiFi probe network names and reference arpcache for IPs

This is a pretty rudimentary 802.11 probe network capture tool. It for the most part only works on Macs, and newer macs at that.
A more complex analysis tool in NodeJS or C++ would be more valuable.

But this is a fun script.

# To Run:
```
- git clone https://github.com/falconscript/probe.sh.git
- ./probe.sh/probeCapture.sh
```

# Example output:
```
host:probe.sh user$ ./probeCapture.sh 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on en0, link-type IEEE802_11_RADIO (802.11 plus radiotap header), capture size 256 bytes
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(HarrysiPhone)	 SA aa:bb:cc:dd:ee:ff	-62dB -92dB	    [+] MATCH FOR (HarrysiPhone) - ? (192.168.1.5) at aa:bb:cc:dd:ee:ff on en0 ifscope [ethernet]
(ATT175)	 SA 11:22:33:44:55:66	-88dB -92dB
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
(ATT175)	 SA 11:22:33:44:55:66	-88dB -92dB
(ATT175)	 SA 11:22:33:44:55:66	-88dB -92dB
(ATT175)	 SA 11:22:33:44:55:66	-88dB -92dB
(NETGEAR11)	 SA 44:55:66:77:88:99	-86dB -92dB
```

Output Template is:
```(BSSID requested) [SA - Source Mac address] [-xxdB strengths] [ [+] Matching IP found from arpcache ]```
