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
