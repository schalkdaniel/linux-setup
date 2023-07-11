# Linux setup

This setup is a lightweight setup that I use for my daily work. There are a few requirements I have regarding my technical setup that are:

- It should not be too specific regarding the OS. Currently, I am using a custom [arch](https://archlinux.org/) install with [i3wm](https://i3wm.org) as desktop environment.
- Easy installable (preferably just from the terminal).
- The setup should have a good trade-off between _flexibility - appearance - extendibility_

I played a lot with other IDEs like VSCode, Sublime, RStudio but always returned to plain VIM.

This repository is more a summary about the tools and how to install everything and thoughts from me about some issues (like a diary).

## Tools

- Terminal: [alacritty](https://github.com/alacritty/alacritty)
  - Config: `.config/alacritty/alacritty.yml`
- Shell: [zsh](https://www.zsh.org/)
  - Themes: [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Fish-like autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) ([themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes))
- Editor: [nvim](https://neovim.io/)
  - Config: `.config/nvim/init.vim`
- Markdown editor: [Typora](https://typora.io/)

## Current OS

- [Arch linux](https://archlinux.org/)
- IDE: [i3](https://i3wm.org/)
- [OLD] IDE: [Budgie desktop](https://de.wikipedia.org/wiki/Budgie_(Desktop-Umgebung)

## i3 specific stuff

- Manage desktops requires [`xrandr`](https://wiki.archlinux.org/title/xrandr).
- To add a second monitor use `xrandr --output DP-2 --auto --right-of eDP-1`.
- Use `xrandr` to get an overview of connected monitors and resolutions.
- To adjust the resolution use:
  - `xrandr --output eDP-1 --mode 1920x1090` for a specific resolution.
  - `xrandr --output eDP-1 --auto` for the maximal resolution.
- Connect to wifi with `nmcli` (should be installed by default):
  - `nmcli dev wifi` to show available connections
  - `nmcli device wifi connect APname password XXXX` to connect with network

## Other notes

- Update mirrorlist: Install `pacman-mirrorlist` and use `sudo pacman -u`
