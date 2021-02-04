#!/bin/sh

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

cp iptablesOTF.sh /usr/local/bin/iptablesOTF.sh

echo "Script is running as : `whoami`"

var0=$(who am i | awk '{print $1}')
echo "Will be instaled to user $var0"

# choose profile template

#message1="Do you want use a workstation template?"
##################################################
#yes_or_no "$message1" && cp /home/$var0/.iptablesOTF/#iptables.conf_dummy_workstation /home/$var0/.iptablesOTF/iptables.conf

# create folder iptables 
if [ ! -e /home/$var0/.iptablesOTF ]; then # -e 
    mkdir /home/$var0/.iptablesOTF
    echo "folder /home/$var0/.iptablesOTF created"
    else 
        echo "folder /home/$var0/.iptablesOTF exist! Skiping!"
    fi
# create backup folder 
if [ ! -e /home/$var0/.iptablesOTF/backups ]; then
    mkdir /home/$var0/.iptablesOTF/backups
    echo "folder /home/$var0/.iptablesOTF/backups created"
    else 
        echo "folder /home/$var0/.iptablesOTF/backups exist! Skiping!"
    fi
# create empty iptables file folder 
if [ ! -f /home/$var0/.iptablesOTF/iptables.conf ]; then
    touch /home/$var0/.iptablesOTF/iptables.conf
fi

#cd /home/$var0/.iptablesOTF
cp iptables.conf_dummy_workstation /home/$var0/.iptablesOTF/
cp iptables.conf_dummy_server /home/$var0/.iptablesOTF/

#adjust permissions
cd /home/$var0 #/.iptablesOTF/backups
chown $var0 .iptablesOTF
cd /home/$var0/.iptablesOTF 
chown $var0 backups
find . -type f -name '*.conf' | xargs chown $var0
#cd ..
chown $var0 *

echo "Done! "
echo "execute /usr/local/bin/iptablesOTF.sh to configure and backup iptables rules"
echo "backups are in /home/$var0/.iptablesOTF/backups"
