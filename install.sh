sudo apt update

sudo apt install bat neovim tmux fzf stow -y

sudo apt install snapd

# Create simlinks for all the config files

#pushd ~/dev

mkdir -p ~/.config

# -t defines the target directory, so where the symlinks should be created
# -DS means, stow should first delete old symlinks and then create new ones from the given stow directory
stow -t ~ -DS configs

#stow -t ~/.config -DS config

#mkdir -p ~/.local/bin
#stow -t ~/.local/bin -DS scripts

#popd
