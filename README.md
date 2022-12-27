# server
Knowledge, script and config files I need to setup my personal server
# Additional config
## disable lid switch 
sudo vim /etc/systemd/logind.conf

```
[Login]
#NAutoVTs=6
#ReserveVT=6
#KillUserProcesses=no
#KillOnlyUsers=
#KillExcludeUsers=root
#InhibitDelayMaxSec=5
#UserStopDelaySec=10
#HandlePowerKey=poweroff
#HandlePowerKeyLongPress=ignore
#HandleRebootKey=reboot
#HandleRebootKeyLongPress=poweroff
#HandleSuspendKey=suspend
#HandleSuspendKeyLongPress=hibernate
#HandleHibernateKey=hibernate
#HandleHibernateKeyLongPress=ignore
HandleLidSwitch=ignore
#HandleLidSwitchExternalPower=suspend
#HandleLidSwitchDocked=ignore
#PowerKeyIgnoreInhibited=no
#SuspendKeyIgnoreInhibited=no
#HibernateKeyIgnoreInhibited=no
LidSwitchIgnoreInhibited=yes
#RebootKeyIgnoreInhibited=no
#HoldoffTimeoutSec=30s
#IdleAction=ignore
#IdleActionSec=30min
#RuntimeDirectorySize=10%
#RuntimeDirectoryInodesMax=
#RemoveIPC=yes
#InhibitorsMax=8192
#SessionsMax=8192

```
