#!/bin/sh

cp iptablesOTF.sh /usr/loca/bin/

echo "Script is executed as : `whoami`"

var0=$(who am i | awk '{print $1}')
echo "var0 is $var0"

##################################################
cd /home/$var0/.iptablesOTF

# create folder e environment
mkdir /home/$var0/.iptablesOTF
mkdir /home/$var0/.iptablesOTF/backups
touch /home/$var0/.iptablesOTF/iptables.conf
cp iptables.conf_dummy_workstation /home/$var0/.iptablesOTF/
cp iptables.conf_dummy_workstation /home/$var0/.iptablesOTF/
