#!/usr/bin/env bash

BREWS="stow fish tree fzf ack git jrnl"
CASKS="fork"
STOWS="bin vim fish git ack ruby lldb"

# exit if any command fails
set -e

if [[ ! -d ~/bin ]]; then
    mkdir ~/bin
fi

# Submodules
if [[ -f .gitmodules ]]; then
    echo "Updating dotfiles submodules..."
    git submodule update --init --recursive
fi

# Homebrew
if [[ ! -f ~/bin/brew ]]; then
    echo "Installing homebrew..."
    mkdir ~/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/brew
    ln -s ~/brew/bin/brew ~/bin

    ~/bin/brew tap homebrew/cask
fi

echo "Installing homebrew packages..."
for pkg in $BREWS; do
    if ! command -v $pkg >/dev/null 2>&1; then
        ~/bin/brew install $pkg
    fi
done

for cask in $CASKS; do
    if ! command -v $cask >/dev/null 2>&1; then
        ~/bin/brew cask install $cask
    fi
done

# dotfiles
echo "Setting up dotfiles..."
~/bin/stow --verbose $STOWS

# Vim
if [[ ! -d ~/.vim/pack/minpac/opt/minpac ]]; then
    echo "Installing vim package manager..."
    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
fi
if [[ ! -f ~/.vim/plugin/fzf.vim ]]; then
    echo "Linking fzf vim plugin..."
    ln -s ~/opt/fzf/plugin/fzf.vim ~/.vim/plugin/
fi
echo "Updating vim plugins..."
sleep 1
vim +PackUpdate +qall
