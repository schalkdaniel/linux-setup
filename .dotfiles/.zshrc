[[ -f ~/linux-setup/.dotfiles/.aliases ]] && . ~/linux-setup/.dotfiles/.aliases
[[ -f ~/linux-setup/.dotfiles/.exports ]] && . ~/linux-setup/.dotfiles/.exports

export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="half-life"
ZSH_THEME="af-magic"

plugins=(git)

# PLUGINS:
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh || echo -e '\033[33m[ ! ]\033[0m ZSH auto-suggestions not installed'
#PLUGINS_DIR=/usr/share/zsh/plugins
#source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null || echo -e '\033[33m[ ! ]\033[0m ZSH auto-suggestions not installed'

source $ZSH/oh-my-zsh.sh
