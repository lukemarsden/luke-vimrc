#!/usr/bin/env bash
if [ -f .bashrc ]; then
    mv .bashrc .bashrc.backup
fi
ln -s luke-vimrc/.bashrc

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


