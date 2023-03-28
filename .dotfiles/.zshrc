[[ -f ~/linux-setup/.dotfiles/.aliases ]] && . ~/linux-setup/.dotfiles/.aliases
[[ -f ~/linux-setup/.dotfiles/.exports ]] && . ~/linux-setup/.dotfiles/.exports

# Use oh my zsh
export ZSH=$HOME/.oh-my-zsh

# ------------------------------- ZSH SETTINGS --------------------------------
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
bindkey -v
#
# ----- plugins -----
PLUGINS_DIR=/usr/share/zsh/plugins
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH auto-suggestions not installed'
source $PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH highlighting not installed'

autoload compinit && compinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# ------------------------------- ZSH SETTINGS --------------------------------
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
