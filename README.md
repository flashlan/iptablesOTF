# iptablesOTF
iptablesOTF mean "Iptables On The Fly"


What this script does?
It does, in a order:
 * Create a hidden folder ".iptablesOTF" in your home directory for store configurations and backups.
 * Stop iptables services.
 * Backup your current settings (Ie:/var/lib/iptables/rules-save and changes made with iptablesOTF).
 * Open your default editor to edit rules.
 * After editing and close editor, the script restart desidered services. 

There are two dummy files in ~/.firewall folder with templates that you can use and modify  to configure your iptables firewall according to use: workstation or server.

__Features__
-----------
You can choose between some pre-configured tamplates or start from a blank iptables.conf file

__Install:__
-----------
run "./install.sh" as root (using Sudo/Doas)

TODO: 
- [ ] make a wizard.
