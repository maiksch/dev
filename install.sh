sudo apt update

sudo apt install git curl bat neovim tmux fzf stow snapd -y

pushd ./runs

./git.sh
./zsh.sh
./ghostty.sh
./docker.sh

./zed.sh
./chrome.sh
./1password.sh
./discord.sh

# Create simlinks for all the config files

#mkdir -p ~/.config

# -t defines the target directory, so where the symlinks should be created
# -DS means, stow should first delete old symlinks and then create new ones from the given stow directory
stow -t ~ -DS configs

#stow -t ~/.config -DS config

#mkdir -p ~/.local/bin
#stow -t ~/.local/bin -DS scripts

popd
