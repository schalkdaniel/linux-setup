#!/bin/bash

ZSH_CONF=~/linux-setup/.dotfiles/.zshrc
TERMITE_CONF=~/.config/termite/config

eval "cp "$ZSH_CONF" "$ZSH_CONF"_backup"

# Remove Windows line endings:
sed -i 's/\r//' $TERMITE_CONF
# Remove all spaces (important for spaces between = and colors) but keep spaces in font:
font="$(cat $TERMITE_CONF | grep font)"
sed -ri 's/\s+//g' $TERMITE_CONF
sed -i "/font/c $font" $TERMITE_CONF

getColorFromFile () {
  cat $2 | grep $1= | cut -d= -f2-
}

sed -i '/^POWERLEVEL9K/d' $ZSH_CONF

echo "POWERLEVEL9K_MODE=nerdfont-complete" >> $ZSH_CONF
echo "POWERLEVEL9K_PROMPT_ON_NEWLINE=true" >> $ZSH_CONF
echo "POWERLEVEL9K_RPROMPT_ON_NEWLINE=false" >> $ZSH_CONF
echo "POWERLEVEL9K_SHORTEN_DIR_LENGTH=2" >> $ZSH_CONF
echo "POWERLEVEL9K=truncate_beginning" >> $ZSH_CONF
echo "POWERLEVEL9K_TIME_BACKGROUND="$(getColorFromFile foreground $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_TIME_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_STATUS_BACKGROUND="$(getColorFromFile foreground $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_STATUS_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_TIME_FORMAT=%D{%I:%M}" >> $ZSH_CONF
echo "POWERLEVEL9K_STATUS_VERBOSE=false" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="$(getColorFromFile foreground $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$(getColorFromFile foreground $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$(getColorFromFile color5 $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_DIR_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_DIR_BACKGROUND="$(getColorFromFile color5 $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_RAM_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_RAM_BACKGROUND="$(getColorFromFile color5 $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_FOLDER_ICON=" >> $ZSH_CONF
echo "POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true" >> $ZSH_CONF
echo "POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_UNTRACKED_ICON=●" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_UNSTAGED_ICON=±" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑" >> $ZSH_CONF
echo "POWERLEVEL9K_VCS_COMMIT_ICON=' '" >> $ZSH_CONF
echo "POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{"$(getColorFromFile color4 $TERMITE_CONF)"}╭─%F{"$(getColorFromFile color4 $TERMITE_CONF)"}'" >> $ZSH_CONF
echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{"$(getColorFromFile color4 $TERMITE_CONF)"}╰%f '" >> $ZSH_CONF
echo "POWERLEVEL9K_CUSTOM_OS_ICON='echo   $(whoami) '" >> $ZSH_CONF
echo "POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND="$(getColorFromFile color4 $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND="$(getColorFromFile background $TERMITE_CONF) >> $ZSH_CONF
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)" >> $ZSH_CONF
#echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time ram)" >> $ZSH_CONF
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time ram)" >> $ZSH_CONF

