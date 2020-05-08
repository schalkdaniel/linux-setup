all:
	make tools

tools:
	pacman -S yay
	yay -S git
	make git-setup
	yay -S curl
	yay -S python3
	yay -S lsd
	yay -S zsh
	make zsh-setup
	make vim
	make termite
	make tmux
	make r
	ln -s -f ~/linux-setup/.dotfiles/.bashrc ~/

git-setup:
	ln -s -f ~/linux-setup/.dotfiles/.gitconfig ~/

zsh-setup:
	chsh -s "$( which zsh)"
	make nerd-font
	yay -S zsh-autosuggestions
	yay -S zsh-syntax-highlighting
	yay -S zsh-theme-powerlevel10k
	ln -s -f ~/linux-setup/.dotfiles/.zshrc ~/

vim:
	sudo apt build-dep vim
	git clone https://github.com/vim/vim.git ~/
	cd vim/src
	sudo make distclean
	./configure --enable-gui=no --with-x --enable-pythoninterp
	sudo make
	sudo make install
	mkdir -p ~/.vim/autoload/
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mv plug.vim ~/.vim/autoload/
	ln -s -f ~/linux-setup/.dotfiles/.vimrc ~/

termite:
	yay -S termite
	yay -S otf-hermit
	# mkdir ~/.config/termite/
	# ln -s -f ~/linux-setup/.dotfiles/termite/config ~/.config/termite/config
	yay -S termite-style-git # Use Color 73 and Font Roboto 18

tmux:
	yay -S tmux
	ln -s -f ~/linux-setup/.dotfiles/.tmux.conf ~/
	chmod u+x ~/linux-setup/bin/tmux-base.sh
	sudo ln -s -f ~/linux-setup/bin/tmux-base.sh /usr/local/bin

tmux-color-scheme:
	TMUX_CONF=~/linux-setup/.dotfiles/.tmux.conf
	TERMITE_CONF=~/.config/termite/config
	getColorFromFile () { cat $2 | grep $1= | cut -d= -f2- }
	sed '/^set -g status-right/d' $TMUX_CONF > $TMUX_CONF
	sed '/^set -g status-left/d' $TMUX_CONF > $TMUX_CONF
	echo 'foreground='$(getColorFromFile foreground $TERMITE_CONF) >> test.txt


nerd-font:
	git clone https://github.com/ryanoasis/nerd-fonts.git ~/
	~/nerd-fonts/install.sh
	rm -r ~/nerd-fonts

r:
	yay -S r
	sudo ln -s -f ~/linux-setup/.dotfiles/.Renviron ~/
	sudo ln -s -f ~/linux-setup/.dotfiles/.Rprofile ~/

virtualbox:
	yay -S virtualbox
	yay -S virtualbox-host-modules-arch
	sudo modprobe vboxdrv

