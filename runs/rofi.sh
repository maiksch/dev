sudo apt install rofi -y

pushd ~/dev/configs/.config

mkdir ~/.config/rofi
stow -t ~/.config/rofi -DS rofi

popd
