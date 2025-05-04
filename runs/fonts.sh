pushd /tmp

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
mkdir -p /usr/share/fonts/jetbrains-mono-nerd
unzip JetBrainsMono.zip -d /usr/share/fonts/jetbrains-mono-nerd
fc-cache -v

popd
