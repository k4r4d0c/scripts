!/bin/bash
# Bash script to rotate VPN connection.
# Requirement:          
# Apps: nordvpn installed
#
#
## Variables
                                                                                                                                                                        
target="google.com"
count=$( ping -c 1 google.com | grep icmp* | wc -l )
server=("Germany" "Belgium" "France" "Spain" "UK" "Sweden" "Netherlands" "Denmark" "Norway" "Portugal")
random=$$$(date +%s)

## Script
if [ $count -eq 0 ]
then
echo "Connection interupted, re-initialing connection:"
nordvpn d #stop the vpn tunnel
nordvpn connect --group p2p ${server[$random % ${#server[@]}]} #start the vpn tunnel
else
echo "Connection ok"
fi
