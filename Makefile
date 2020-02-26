all:
	make tools

tools:
	pacman -S yay
	yay -S curl
	yay -S python3
	make vim
	make termite
	make tmux
	make r

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

r:
	yay -S r
	sudo ln -s -f ~/linux-setup/.dotfiles/.Renviron ~/
	sudo ln -s -f ~/linux-setup/.dotfiles/.Rprofile ~/

virtualbox:
	yay -S virtualbox
	yay -S virtualbox-host-modules-arch
	sudo modprobe vboxdrv

aliases:
	cat ~/.dotfiles/.aliases >> ~/.config/fish/config.fish
	cat ~/.dotfiles/.aliases >> ~/.bashrc
