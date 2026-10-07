#!/bin/bash

red="\e[91m"
grn="\e[92m"
ylo="\e[93m"
blue="\e[94m"
cyan="\e[96m"
pink="\e[95m"
rset="\e[0m"

banner() {
clear
echo -e "$cyan"
cat << "EOF"

███╗   ██╗███████╗████████╗
████╗  ██║██╔════╝╚══██╔══╝
██╔██╗ ██║█████╗     ██║
██║╚██╗██║██╔══╝     ██║
██║ ╚████║███████╗   ██║
╚═╝  ╚═══╝╚══════╝   ╚═╝

██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
██║ █╗ ██║██║   ██║██████╔╝█████╔╝
██║███╗██║██║   ██║██╔══██╗██╔═██╗
╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

EOF

echo -e "$pink Network Utility Toolkit$rset"
echo
}

menu() {
echo -e "$ylo[1] Show IP Address$rset"
echo -e "$ylo[2] Network Interfaces$rset"
echo -e "$ylo[3] DNS Information$rset"
echo -e "$ylo[4] Ping Test$rset"
echo -e "$ylo[5] Routing Table$rset"
echo -e "$ylo[6] System Information$rset"
echo -e "$ylo[7] About$rset"
echo -e "$ylo[8] Exit$rset"
echo
read -p "Select Option: " opt

case $opt in
1) ipinfo ;;
2) interfaces ;;
3) dnsinfo ;;
4) pingtest ;;
5) routes ;;
6) sysinfo ;;
7) about ;;
8) exit ;;
*) menu ;;
esac
}

ipinfo() {
clear
echo -e "$grn Public IP$rset"
curl -s ifconfig.me
echo
echo
read -p "Press Enter..."
banner
menu
}

interfaces() {
clear
ip addr
echo
read -p "Press Enter..."
banner
menu
}

dnsinfo() {
clear
cat /etc/resolv.conf
echo
read -p "Press Enter..."
banner
menu
}

pingtest() {
clear
read -p "Enter Host: " host
ping -c 4 "$host"
echo
read -p "Press Enter..."
banner
menu
}

routes() {
clear
ip route
echo
read -p "Press Enter..."
banner
menu
}

sysinfo() {
clear
echo "Hostname:"
hostname
echo
echo "Kernel:"
uname -r
echo
echo "Uptime:"
uptime
echo
read -p "Press Enter..."
banner
menu
}

about() {
clear
echo -e "$cyan"
echo "Network Utility Toolkit"
echo
echo "Information and diagnostics tool"
echo "Safe for learning and testing"
echo
read -p "Press Enter..."
banner
menu
}

banner
menu