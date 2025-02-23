# config

---

On ubuntu 20 or 22: https://stackoverflow.com/questions/77530952/how-to-fix-the-version-issue-between-neovim-and-lazyvim-on-ubuntu-20-or-22-versi

```bash
#no longer needed after neovim update can do else install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

sudo rm /usr/bin/nvim
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

#neovim on older glibc
https://github.com/neovim/neovim-releases?tab=readme-ov-file
#or install from source
https://forums.raspberrypi.com/viewtopic.php?t=180325
https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source
```

else:

```bash
sudo apt install neovim
```

---

https://www.nerdfonts.com/font-downloads

```bash
unzip Hack.zip -d ~/.fonts
unzip Meslo.zip -d ~/.fonts
fc-list
```

```bash
sudo add-apt-repository ppa:aslatter/ppa -y #ubuntu 22
sudo apt install alacritty

sudo apt install i3 tmux zsh
sudo apt install git wget curl xclip fd-find
sudo apt-get install nodejs ripgrep stow
sudo apt install xdotool maim brightnessctl picom luarocks
```

```bash
xev # to check keys
sudo usermod -aG video $USER
sudo reboot
```

https://github.com/eza-community/eza/blob/main/INSTALL.md

---

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #oh my zsh
sudo chsh -s $(which zsh) $USER

sudo apt install polybar
```

---

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

to do reconfiguration:

```bash
p10k configure
```

---

https://yazi-rs.github.io/docs/installation/#cargo

```bash
#older glibc yazi
wget https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip
unzip yazi-x86_64-unknown-linux-musl.zip -d yazi
sudo mv yazi /usr/local/bin
sudo mv ya /usr/local/bin

. "$HOME/.cargo/env" #after installing rustup for yazi
#use . to toggle dotfiles in yazi
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh #install zoxide for batter cd
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash #install npm for node
#nvm install v22
nvm install v16.20.2

https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu

https://github.com/jodhsinghnahal/tmux-polybar

https://www.reddit.com/r/i3wm/comments/jk3y5m/i3_brightness_keys_not_working/

https://github.com/hluk/CopyQ

https://github.com/milaq/XMousePasteBlock
```

```bash
sudo visudo #and add line:
jodh ALL=(ALL) NOPASSWD: /home/jodh/config/dmenu-sudo
~/.local/share/nvim #contains stored nvim data like undo, sessions and buffer order

tmux source ~/.tmux.conf
ctrl-a r #reload tmux
ctr-a shift-i #reload plugins
source ~/.zshrc
alt+shift+r #reload i3
In nvim:
:Lazy
:Lazy reload ...
:qa #exit all nvim
:Mason # use i to install and X to delete
:TSInstall # install treesitter for language
```
