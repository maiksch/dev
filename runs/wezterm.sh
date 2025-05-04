yay -S --noconfirm wezterm-git
sudo pacman -S --noconfirm ttf-nerd-fonts-symbols-mono

if [ $? -eq 0 ]; then
	echo "wezterm installed"
else
	echo "error"
fi
