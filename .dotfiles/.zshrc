[[ -f ~/linux-setup/.dotfiles/.aliases ]] && . ~/linux-setup/.dotfiles/.aliases
[[ -f ~/linux-setup/.dotfiles/.exports ]] && . ~/linux-setup/.dotfiles/.exports

# ------------------------------- ZSH SETTINGS --------------------------------
# ----- options -----
unsetopt NO_BEEP
unsetopt NO_MATCH
setopt AUTO_CD
setopt BEEP
setopt NOMATCH
setopt NOTIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST
setopt NULL_GLOB

HISTFILE="$HOME/.cache/zsh_history"
HIST_STAMPS=mm/dd/yyyy
DISABLE_UPDATE_PROMPT=true
HISTSIZE=5000
SAVEHIST=5000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ccc'
ZLE_RPROMPT_INDENT=0

# ----- keys -----
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word

# ----- promt -----
PS1="%F{cyan} %~ >%F{blue}> %F{reset}"

# ----- plugins -----
PLUGINS_DIR=/usr/share/zsh/plugins
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH auto-suggestions not installed'
source $PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH highlighting not installed'

autoload compinit && compinit

# -------------------------------- POWERLEVEL ---------------------------------


if [[ $(tty) == /dev/pts/* ]]; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH powerlevel10k not installed'
else
	clear
	echo
	echo
fi

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K=truncate_beginning
POWERLEVEL9K_TIME_BACKGROUND=#98d1ce
POWERLEVEL9K_TIME_FOREGROUND=#0a0f14
POWERLEVEL9K_STATUS_BACKGROUND=#98d1ce
POWERLEVEL9K_STATUS_FOREGROUND=#0a0f14
POWERLEVEL9K_TIME_FORMAT=%D{%I:%M}
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=#0a0f14
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=#98d1ce
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=#98d1ce
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=#4e5165
POWERLEVEL9K_DIR_FOREGROUND=#0a0f14
POWERLEVEL9K_DIR_BACKGROUND=#4e5165
POWERLEVEL9K_RAM_FOREGROUND=#0a0f14
POWERLEVEL9K_RAM_BACKGROUND=#4e5165
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=' '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{#195465}╭─%F{#195465}'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{#195465}╰%f '
POWERLEVEL9K_CUSTOM_OS_ICON='echo   daniel '
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND=#195465
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND=#0a0f14
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time ram)
