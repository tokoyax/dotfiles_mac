export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export XMODIFIER="@im=ibus"
export QT_IM_MODULE="ibus"
export DefaultIMModule=ibus

sleep 5

##############################################
# keyrepeat
xset r rate 195 60

##############################################
# xkeysnail
fish -c "sudo systemctl start xkeysnail.service"
#!/bin/sh
