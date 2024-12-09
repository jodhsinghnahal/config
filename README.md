# config

****

On ubuntu 20 or 22: https://stackoverflow.com/questions/77530952/how-to-fix-the-version-issue-between-neovim-and-lazyvim-on-ubuntu-20-or-22-versi
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

sudo rm /usr/bin/nvim
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

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
sudo apt install git wget curl xclip
sudo apt-get install nodejs ripgrep stow
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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

to do reconfiguration:

```bash
p10k configure
```
---

```bash
tmux source ~/.tmux.conf
source ~/.zshrc
```

https://yazi-rs.github.io/docs/installation/#cargo

https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu

```bash
stow i3 alacritty nvim polybar tmux zsh
```
