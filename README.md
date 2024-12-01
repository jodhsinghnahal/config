# config
config
https://major.io/p/tray-icons-in-i3/

# Dev Setup

```bash
sudo apt install git wget curl xclip zsh
sudo apt-get install nodejs ripgrep stow
```

---

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #oh my zsh
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

```bash
source ~/.zshrc
```

---

```bash
tmux source ~/.tmux.conf
```
```bash
source ~/.zshrc
```

