#!/bin/sh

echo "Script is executed as : `whoami`"

var0=$(who am i | awk '{print $1}')
echo "var0 is $var0"

##################################################
cd /home/$var0/.iptablesOTF
cp /home/$var0/.iptablesOTF/iptables.conf /home/$var0/.iptablesOTF/backups/"iptables_orig-`date`.txt"
#debug 
echo "backup created  in /home/$var0/backups "

# backup
cp /var/lib/iptables/rules-save /home/$var0/.iptablesOTF/backups/"rules-save_orig-`date`.txt"
cd /home/$var0/.iptablesOTF/backups
chown orfeu *
cd ..
#chwon orfeu backups/*.*
#echo " backup criado: var is /home/$var0 "

# stop service
rc-service iptables stop
rc-service ip6tables stop

rm /var/lib/iptables/rules-save 
chmod +x /home/$var0/.iptablesOTF/iptables.conf 

echo "old rules are saved  /home/$var0/backups "

# open new config to editing
kate /home/$var0/.iptablesOTF/iptables.conf 
echo "____________Done Editing!_____________"

# executa configuracao
/home/$var0/.iptablesOTF/iptables.conf

# update services
/etc/init.d/iptables save 
/etc/init.d/ip6tables save

# salva backup do arquivo alterado
cp /var/lib/iptables/rules-save /home/$var0/.iptablesOTF/backups/"rules-save_editado`date`.txt"
cd /home/$var0/.iptablesOTF/backups
chown orfeu *
cd ..

# start servicse
rc-service iptables start
rc-service ip6tables start
rc-update add iptables boot
rc-update add ip6tables boot 

echo ""
echo ""
echo "_____________DONE!_________________"
echo ""
echo ""
echo "All config is saved in /home/$var0/.iptablesOTF dir"
echo "All backups are located at /home/$var0/.iptablesOTF/backups dir"
