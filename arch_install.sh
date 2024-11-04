#!/bin/bash
sudo pacman -Syu
sudo pacman -S git

OS=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
DIR_PATH=$(pwd)
echo "$DIR_PATH"
echo "$OS"

if [ "$OS" == "arch" ]; then
  echo "OS arch can continue"
else
  echo "OS not arch"
  exit 1
fi

if ! command -v yay 2>&1 >/dev/null
then
    echo "yay not found"
    mkdir temp
    cd temp
    git clone http://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ../../
    rm -rf temp
else
    echo "yay found"
fi

yay -S zsh
yay -S kitty
yay -S fzf
yay -S zoxide
yay -S neovim
yay -S nextcloud-client
yay -S oh-my-posh-bin
yay -S waybar
yay -S network-manager-applet
yay -S hyprpaper
yay -S ttf-firacode-nerd
yay -S stow
yay -S firefox
yay -S code
yay -S cmake
yay -S wl-clipboard
yay -S tree-sitter-cli
yay -S ranger
yay -S ripgrep
yay -S python
yay -S python-pip
yay -S python-pillow
yay -S base-devel
yay -S brightnessctl
yay -S zip
yay -S unzip
# yay -S peazip
yay -S ufw
yay -S less
yay -S lazygit


cd ~
git clone https://github.com/alvi-youtube/stow.git
if [ -d stow ]; then
  echo "stow Directory exists."
  cd stow
  stow -R .
fi
cd ~

cd "$DIR_PATH"

chsh "$USER"

echo "installation compete ..."
echo "Don't forget to setup and enable ufw firewall"

exit 0

