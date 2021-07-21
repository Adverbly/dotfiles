#! /bin/bash

set -e

# install packages
sudo apt install -y wget 
sudo apt install -y curl
sudo apt install -y git
sudo apt install -y zsh
sudo apt install -y tmux
sudo apt install -y rbenv
sudo apt install -y bison
sudo apt-get install -y curl git mercurial make binutils bison gcc build-essential
sudo apt-get install -y fzf
sudo apt-get install -y xclip
sudo apt-get install -y ffmpeg
sudo apt-get install -y v4l2loopback-dkms
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y obs-studio
sudo apt install -y libpq-dev
sudo apt install -y direnv
sudo apt-get install -y libcurl3-dev
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo apt install -y libnss3-tools
sudo apt install -y hub


# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# install neovim
wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mkdir ~/apps
sudo mv ./nvim.appimage ~/apps/
sudo ln -s ~/apps/nvim.appimage /usr/bin/nvim

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# install powerlevel10k
## MANUAL: install fonts: https://github.com/romkatv/powerlevel10k#manual-font-installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
## MANUAL: Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
source ~/.zshrc # will configure the prompt

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# install rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# install gvm
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.16


# install fzf
# nothing to do?

# install vscode
## manual??

# install rubymine
## manual?
# install atom icons
# install material theme + configure it
# tweak fonts, appearance
# add external tools
npm install --global prettier @prettier/plugin-ruby
# create external tool that runs program: prettier, arguments: --write $FilePath$

# symlink saved config
mv $HOME/.zshrc $HOME/.zshrc-old
ln -s "$(pwd)/.zshrc" $HOME/.zshrc
mv $HOME/.tmux.conf.local $HOME/.tmux.conf.local-old
ln -s "$(pwd)/.tmux.conf.local" $HOME/.tmux.conf.local
mkdir -p $HOME/.config/nvim
ln -s "$(pwd)/init.vim" $HOME/.config/nvim/init.vim


# increase file watcher limit
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

