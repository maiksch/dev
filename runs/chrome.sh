yay -S --noconfirm google-chrome

if [ $? -eq 0 ]; then
	echo "Google Chrome installed."
else
	echo "Error while installing Google Chrome."
fi
