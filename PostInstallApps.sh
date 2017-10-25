#!/bin/sh
# System Requirement: Ubuntu
# Display manually installed apps
# zgrep 'Commandline: apt install' /var/log/apt/history.log /var/log/apt/history.log.*.gz

# List Apps to install here
APPS = htop nano inxi powertop powerline solaar android-tools-adb \
android-tools-fastboot python-pip git python3-pip npm nodejs pylint \
ctags screenfetch youtube-dl tlp weechat gtkhash gparted gcc make

# Update system
sudo apt update
sudo apt upgrade -y

# Install Apps
sudo apt install $APPS -y

# Get Signing Key for Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

# Add Google Chrome Repo to sources.list.d
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update System and Install Google Chrome
sudo apt-get update
sudo apt-get install google-chrome-stable

# Get gpg key for VSCode 
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Add Microsoft VSCode Repo to sources.list.d
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update System and Install VSCode
sudo apt-get update
sudo apt-get install code

# Test for powerline in .bashrc
# if grep -Fxq "powerline" $HOME/.bashrc
# then
    # echo '.bashrc has powerline config statement'
# else 
    # echo '# enable powerline for bash terminal' >> $HOME/.bashrc
    # echo 'if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then' >> $HOME/.bashrc
    # echo '   source /usr/share/powerline/bindings/bash/powerline.sh' >> $HOME/.bashrc
    # echo 'fi' >> $HOME/.bashrc
    # echo 'Updated .bashrc for powerline'
# fi