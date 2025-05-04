echo "Installing 1password"

yay -S --noconfirm 1password

if [ $? -eq 0 ]; then
	echo "ok"
else
	echo "error"
	exit 1
fi

mkdir -p ~/.ssh
#echo "Host *\n\tIdentityAgent ~/.1password/agent.sock" >> ~/.ssh/config
