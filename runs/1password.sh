sudo apt install gnupg2 -y

wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb

sudo dpkg -i 1password-latest.deb

rm 1password-latest.deb

mkdir ~/.ssh
echo "Host *\n\tIdentityAgent ~/.1password/agent.sock" >> ~/.ssh/config
