#!/bin/bash
source ../common.sh

mkdir -p $HOME/.local/share/nvim/site/autoload
mkdir -p $HOME/.config/nvim
make_link "$(pwd)"/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim
make_link "$(pwd)"/init.vim $HOME/.config/nvim/init.vim
