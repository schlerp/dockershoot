#!/bin/bash

# install basic requirements
echo apt updating and installing basic tools...
{
  apt update
  apt install --no-install-recommends -y git clang netcat unzip ripgrep
} &> /dev/null

# install neovim 0.8.1
echo install neovim v0.8.1...
{
  curl --output-dir /tmp/ -L -O https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.deb
  apt install -y /tmp/nvim-linux64.deb
} &> /dev/null

# install nvchad neovim config
echo adding NVChad neovim config...
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 || echo neovim config already exists, skipping NVChad install!

echo "done!"
