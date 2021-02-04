# iptablesOTF
iptablesOTF mean "Iptables On The Fly"


What this script does?
It does, in a order:
 * Create a hidden folder ".iptablesOTF" in your home directory for store configurations and backups
 * Stop iptables services
 * Backup your current settings (Ie:/var/lib/iptables/rules-save and changes made with iptablesOTF)
 * Open your default editor to edit rules
 * After editing and close editor, the script restatrt services 

There are two dummy files in ~/.firewall folder with templates that you can use and modify  to configure your iptables firewall
