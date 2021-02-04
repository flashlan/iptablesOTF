# iptablesOTF
iptablesOTF mean "Iptables On The Fly"


What this script does?
It does, in a order:
 * Create a hidden folder ".firewall" in your home directory with config and backups
 * Stop iptables services
 * Backup your current settings
 * Open your default editor to edit rules
 * After editing and close editor, the script restatrt services 

There are two dummy files in ~/.firewall folder with templates that you can use and modify  to configure your iptables firewall
