#!/bin/bash
set -e
source ../common.sh
make_link "$(pwd)"/nvim $HOME/.config/nvim
