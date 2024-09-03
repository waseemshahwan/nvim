#!/bin/bash

# Check if neovim is installed
if ! command -v nvim &> /dev/null
then
    echo "You need neovim installed first to install this configuration."
    exit 1
fi

# Backup existing neovim config if exists
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak.$(date +%s)
fi

# Get config from Github
cd $(mktemp -d)
git clone https://github.com/waseemshahwan/nvim 
cp -r nvim/config ~/.config/nvim

# Run the necessary post-installation commands
nvim --headless "+Lazy! update" +MasonInstallAll +q!

