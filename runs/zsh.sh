#/bin/sh

sudo apt install zsh -y

# set zsh as default shell
chsh -s $(which zsh) $(whoami)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc -y

# install zsh autosuggestions
rm -rf ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# install zsh theme
#mkdir -p ~/.oh-my-zsh/custom/themes
#cp files/maiksch.zsh-theme ~/.oh-my-zsh/custom/themes/
