# config
config
https://major.io/p/tray-icons-in-i3/
sudo apt-get install nodejs ripgrep


sudo apt install git wget curl xclip zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #oh my zsh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k #pwr lvl 10k
source ~/.zshrc

"terminal.integrated.fontFamily": "MesloLGS NF" #if vscode updt settings.json
p10k configure #reconfigure
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Development Environment Setup

This guide will walk you through setting up a powerful terminal environment using Zsh, Powerlevel10k, and tmux with plugins.

---

## Prerequisites

Ensure you have `sudo` privileges to install packages.

---

## Step 1: Install Required Tools

Run the following command to install essential tools:

```bash
sudo apt install git wget curl xclip zsh
```

---

## Step 2: Install Oh My Zsh

Install [Oh My Zsh](https://ohmyz.sh) using the official installation script:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

## Step 3: Install Powerlevel10k Theme

Clone the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme repository into your custom themes directory:

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Update your `~/.zshrc` file to use Powerlevel10k:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Then reload Zsh:

```bash
source ~/.zshrc
```

### Configure Powerlevel10k

Run the configuration wizard:

```bash
p10k configure
```

For the best experience in VS Code, update your terminal font in `settings.json`:

```json
"terminal.integrated.fontFamily": "MesloLGS NF"
```

---

## Step 4: Add Zsh Plugins

Enhance Zsh with useful plugins:

### Autosuggestions

Clone the [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) plugin:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Syntax Highlighting

Clone the [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugin:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Enable these plugins in your `~/.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Reload Zsh to apply changes:

```bash
source ~/.zshrc
```

---

## Step 5: Set Up tmux with Plugins

Install the [tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm):

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Add the following to your `~/.tmux.conf` to enable TPM:

```bash
set -g @plugin 'tmux-plugins/tpm'

# Initialize TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'
```

Reload your tmux configuration:

```bash
tmux source ~/.tmux.conf
```

Press `Prefix` (default is `Ctrl+B`), then `I` to install plugins.

---

## Final Steps

Your terminal environment is now set up with Zsh, Powerlevel10k, and tmux! Customize further as needed.

---
