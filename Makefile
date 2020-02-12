all:
	make tools

tools:
	pacman -S yay
	yay -S curl
	make vim
	make termite
	make tmux

vim:
	sudo apt build-dep vim
	git clone https://github.com/vim/vim.git
	cd vim/src
	sudo make distclean
	./configure --enable-gui=no --with-x --enable-pythoninterp
	sudo make
	sudo make install
	ln -s -f ~/linux-setup/.dotfiles/.vimrc ~/

termite:
	yay -S termite
	yay -S otf-hermit
	mkdir ~/.config/termite/
	ln -s -f ~/linux-setup/.dotfiles/termite/config ~/.config/termite/config

tmux:
	yay -S tmux
	ln -s -f ~/linux-setup/.dotfiles/.tmux.conf ~/
	chmod u+x ~/linux-setup/bin/tmux-base.sh
	sudo ln -s -f ~/linux-setup/bin/tmux-base.sh /usr/local/bin

virtualbox:
	yay -S virtualbox
	yay -S virtualbox-host-modules-arch
	sudo modprobe vboxdrv

aliases:
	cat ~/.dotfiles/.aliases >> ~/.config/fish/config.fish
	cat ~/.dotfiles/.aliases >> ~/.bashrc

r:
	yay -S r
