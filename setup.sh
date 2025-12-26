#!/usr/bin/env bash

cd luke-vimrc && git submodule init && cd ..
cd luke-vimrc && git submodule update && cd ..

if [ -f .bashrc ]; then
    mv .bashrc .bashrc.backup
fi
ln -s luke-vimrc/.bashrc

if [ -f .bash_profile ]; then
    mv .bash_profile .bash_profile.backup
fi
ln -s luke-vimrc/.bashrc .bash_profile

if [ -f .vimrc ]; then
    mv .vimrc .vimrc.backup
fi
ln -s luke-vimrc/.vimrc

if [ -d .vim ]; then
    mv .vim .vim.backup
fi
ln -s luke-vimrc/.vim

if [ -f .inputrc ]; then
    mv .inputrc .inputrc.backup
fi
ln -s luke-vimrc/.inputrc

if [ -f .screenrc ]; then
    mv .screenrc .screenrc.backup
fi
ln -s luke-vimrc/.screenrc

if [ -f .tmux.conf ]; then
    mv .tmux.conf .tmux.conf.backup
fi
ln -s luke-vimrc/.tmux.conf

# Ubuntu-specific setup (not WSL)
if [[ "$(uname)" == "Linux" ]] && grep -qi ubuntu /etc/os-release 2>/dev/null && ! grep -qi microsoft /proc/version 2>/dev/null; then
    # keyd: remap airplane mode key to sleep (Alt+WLAN)
    if ! command -v keyd &> /dev/null; then
        sudo apt-get install -y keyd
    fi
    sudo tee /etc/keyd/default.conf << 'EOF'
[ids]
*

[main]
wlan = noop

[alt]
wlan = sleep
EOF
    sudo systemctl restart keyd
    sudo systemctl enable keyd
fi
