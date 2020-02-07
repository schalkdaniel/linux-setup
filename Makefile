
tools:
	pacman -S yay
	make tmux

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

R:
	yay -S r
