sudo apt install polybar -y

#rm -f ~/.config/polybar/config.ini
#cp -r ../configs/.config/polybar/ ~/.config/

pushd ~/dev/configs/.config

mkdir ~/.config/polybar
stow -t ~/.config/polybar -DS polybar

popd
