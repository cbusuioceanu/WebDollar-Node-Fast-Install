#!/bin/bash

#### COLOR SETTINGS ####
BLACK=$(tput setaf 0 && tput bold)
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
YELLOW=$(tput setaf 3 && tput bold)
BLUE=$(tput setaf 4 && tput bold)
MAGENTA=$(tput setaf 5 && tput bold)
CYAN=$(tput setaf 6 && tput bold)
WHITE=$(tput setaf 7 && tput bold)
BLACKbg=$(tput setab 0 && tput bold)
REDbg=$(tput setab 1 && tput bold)
GREENbg=$(tput setab 2 && tput bold)
YELLOWbg=$(tput setab 3 && tput bold)
BLUEbg=$(tput setab 4 && tput dim)
MAGENTAbg=$(tput setab 5 && tput bold)
CYANbg=$(tput setab 6 && tput bold)
WHITEbg=$(tput setab 7 && tput bold)
STAND=$(tput sgr0)

### System dialog VARS
showinfo="$GREEN[info]$STAND"
showerror="$RED[error]$STAND"
showexecute="$YELLOW[running]$STAND"
showok="$MAGENTA[OK]$STAND"
showdone="$BLUE[DONE]$STAND"
showinput="$CYAN[input]$STAND"
showwarning="$RED[warning]$STAND"
showremove="$GREEN[removing]$STAND"
shownone="$MAGENTA[none]$STAND"
redhashtag="$REDbg$WHITE#$STAND"
abortfm="$CYAN[abort for Menu]$STAND"
##

### GENERAL VARS
getwebdnodefolder=$(find / -name Node-WebDollar)
getport80=$(iptables -L -n | grep -w 80 | awk 'NR==1{print$7}' | cut -d ':' -f2)
getport443=$(iptables -L -n | grep -w 443 | awk 'NR==1{print$7}' | cut -d ':' -f2)
getport8080=$(iptables -L -n | grep -w 8080 | awk 'NR==1{print$7}' | cut -d ':' -f2)
getport8081=$(iptables -L -n | grep -w 8081 | awk 'NR==1{print$7}' | cut -d ':' -f2)
getport8082=$(iptables -L -n | grep -w 8082 | awk 'NR==1{print$7}' | cut -d ':' -f2)
###

#### ROOT User Check
function checkroot(){
        if [[ $(id -u) = 0 ]]; then
                echo -e "$showinfo Checking for ROOT: ${GREEN}PASSED${STAND}"
        else
                echo -e "$showinfo Checking for ROOT: $showerror\\n${RED}This Script Needs To Run Under ROOT user!${STAND}"
                exit 0
        fi
}

checkroot

apt update
apt upgrade
apt dist-upgrade

git clone https://github.com/WebDollar/Node-WebDollar.git Node-WebDollar


apt install linuxbrew-wrapper
apt install clang
apt install npm
apt install nodejs

npm install -g node-gyp
npm install pm2 -g --unsafe-perm


echo "$showinfo Setting IP Tables rules..."

if [[ "$getport80" == 80 ]]; then echo "$showwarning Port 80 is already accepted in Firewall!"; else if [[ ! "$getport80" == 80 ]]; then echo "$showdone Setting Firewall rule for PORT 80."; iptables -A INPUT -p tcp --dport 80 -j ACCEPT;$
if [[ "$getport443" == 443 ]]; then echo "$showwarning Port 443 is already accepted in Firewall!"; else if [[ ! "$getport443" == 443 ]]; then echo "$showdone Setting Firewall rule for PORT 443."; iptables -A INPUT -p tcp --dport 443 -j $
if [[ "$getport8080" == 8080 ]]; then echo "$showwarning Port 8080 is already accepted in Firewall!"; else if [[ ! "$getport8080" == 8080 ]]; then echo "$showdone Setting Firewall rule for PORT 8080."; iptables -A INPUT -p tcp --dport 8$
if [[ "$getport8081" == 8081 ]]; then echo "$showwarning Port 8081 is already accepted in Firewall!"; else if [[ ! "$getport8081" == 8081 ]]; then echo "$showdone Setting Firewall rule for PORT 8081."; iptables -A INPUT -p tcp --dport 8$
if [[ "$getport8082" == 8082 ]]; then echo "$showwarning Port 8082 is already accepted in Firewall!"; else if [[ ! "$getport8082" == 8082 ]]; then echo "$showdone Setting Firewall rule for PORT 8082."; iptables -A INPUT -p tcp --dport 8$

echo "$showinfo Don't forget to FORWARD PORTS on your router!"

echo "$showinfo Changing folder to $getwebdnodefolder"

cd $getwebdnodefolder
npm install

echo "$showinfo Now you may run sudo bash custom_start.sh"
echo "$showinfo If you don't have custom_start.sh script, run: "
echo "git clone https://github.com/cbusuioceanu/WebDollar-Node-Custom-Start.git"
echo "$showinfo sudo bash custom_start.sh"
echo "$showinfo Have fun. :)"
