#!/usr/bin/env bash

LOCAL="$HOME/.local"
BREWS="stow fish tree ack"
CASKS=""
STOWS="bin vim fish git shell ack ruby lldb"

# exit if any command fails
set -e

if [[ ! -d $LOCAL/bin ]]; then
    mkdir -p $LOCAL/bin
fi
PATH="$LOCAL/bin:$PATH"

# Submodules
if [[ -f .gitmodules ]]; then
    echo "Updating dotfiles submodules..."
    git submodule update --init --recursive
fi

# Homebrew
if [[ ! -f $LOCAL/bin/brew ]]; then
    echo "Installing homebrew..."
    mkdir $LOCAL/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $LOCAL/homebrew
    ln -s $LOCAL/homebrew/bin/brew $LOCAL/bin
fi

echo "Installing homebrew packages..."
for pkg in $BREWS; do
    if ! command -v $pkg >/dev/null 2>&1; then
        brew install $pkg
    fi
done

if [[ -ne $CASKS ]]; then
    brew tap homebrew/cask
    for cask in $CASKS; do
        if ! command -v $cask >/dev/null 2>&1; then
            brew cask install $cask
        fi
    done
fi

# dotfiles
echo "Setting up dotfiles..."
stow --verbose $STOWS

# Vim
MINPAC="$HOME/.vim/pack/minpac/opt/minpac"
if [[ ! -d $MINPAC && ! -L $MINPAC ]]; then
    echo "Installing vim package manager..."
    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
fi

echo "Updating vim plugins..."
sleep 1
vim +PackUpdate +qall
