#!/bin/bash

TMUX_CONF=~/linux-setup/.dotfiles/.tmux.conf
TERMITE_CONF=~/.config/termite/config

eval "cp "$TMUX_CONF" "$TMUX_CONF"_backup"

# Remove Windows line endings:
sed -i 's/\r//' $TERMITE_CONF
# Remove all spaces (important for spaces between = and colors) but keep spaces in font:
font="$(cat $TERMITE_CONF | grep font)"
sed -ri 's/\s+//g' $TERMITE_CONF
sed -i "/font/c $font" $TERMITE_CONF

getColorFromFile () {
  cat $2 | grep $1= | cut -d= -f2-
}

sed -i '/^set -g status-bg/d' $TMUX_CONF
sed -i '/^set -g message-style/d' $TMUX_CONF
sed -i '/^set -g message-style/d' $TMUX_CONF
sed -i '/^set -g message-command-style/d' $TMUX_CONF
sed -i '/^set -g pane-border-style/d' $TMUX_CONF
sed -i '/^set -g pane-active-border-style/d' $TMUX_CONF
sed -i '/^setw -g window-status-activity-style/d' $TMUX_CONF
sed -i '/^setw -g window-status-style/d' $TMUX_CONF
sed -i '/^set -g status-left/d' $TMUX_CONF
sed -i '/^set -g status-right/d' $TMUX_CONF

echo "set -g status-bg \""$(getColorFromFile background $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "set -g message-style fg=\""$(getColorFromFile foreground $TERMITE_CONF)"\",bg=\""$(getColorFromFile background $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "set -g message-command-style fg=\""$(getColorFromFile foreground $TERMITE_CONF)"\",bg=\""$(getColorFromFile background $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "set -g pane-border-style fg=\""$(getColorFromFile color4 $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "set -g pane-active-border-style fg=\""$(getColorFromFile color5 $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "setw -g window-status-activity-style fg=\""$(getColorFromFile foreground $TERMITE_CONF)"\",bg=\""$(getColorFromFile background $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "setw -g window-status-style fg=\""$(getColorFromFile foreground $TERMITE_CONF)"\",bg=\""$(getColorFromFile background $TERMITE_CONF)"\"" >> $TMUX_CONF
echo "set -g status-left '#[fg="$(getColorFromFile background $TERMITE_CONF)",bg="$(getColorFromFile color4 $TERMITE_CONF)"]  "$(whoami)" #[fg="$(getColorFromFile color4 $TERMITE_CONF)",bg="$(getColorFromFile color5 $TERMITE_CONF)"]  #[fg="$(getColorFromFile background $TERMITE_CONF)",bg="$(getColorFromFile color5 $TERMITE_CONF)"] #S #[fg=#a1b56c,bg="$(getColorFromFile background $TERMITE_CONF)",nobold,nounderscore,noitalics] #[fg=#86c1b9,bg="$(getColorFromFile background $TERMITE_CONF)"] #W'" >> $TMUX_CONF
echo "set -g status-right '#[fg="$(getColorFromFile foreground $TERMITE_CONF)",bg="$(getColorFromFile background $TERMITE_CONF)"]#[fg="$(getColorFromFile background $TERMITE_CONF)",bg="$(getColorFromFile foreground $TERMITE_CONF)"] %a  %Y #[fg="$(getColorFromFile color5 $TERMITE_CONF)",bg="$(getColorFromFile foreground $TERMITE_CONF)"]#[fg="$(getColorFromFile background $TERMITE_CONF)",bg="$(getColorFromFile color5 $TERMITE_CONF)"] DDOG '" >> $TMUX_CONF

