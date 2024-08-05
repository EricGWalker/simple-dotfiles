#!/usr/bin/env sh

# Vim Plug Installation
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# TPM Plugin Manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

