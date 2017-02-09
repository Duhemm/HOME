xbindkeys
xrdb "$HOME/.Xresources"
xmodmap "$HOME/.Xmodmap"
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad

