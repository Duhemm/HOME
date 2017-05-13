xbindkeys
xrdb "$HOME/.Xresources"
xmodmap "$HOME/.Xmodmap"
xset r rate 175 50
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
