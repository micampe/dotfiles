#!/usr/bin/env bash

set -e

cd ~
if [[ ! -d ~/brew ]]; then
    git clone https://github.com/Homebrew/brew
fi

if [[ ! -f ~/bin/brew ]]; then
    ln -s ~/brew/bin/brew ~/bin
fi
PATH=$PATH:~/bin

brew install fish
brew install ack
brew install fzf
brew install tree
# brew install chisel
# brew install exiftool
# brew install ag
# brew install git
# brew install vim

brew tap caskroom/cask

#brew cask install daisydisk
#brew cask install adobe-creative-cloud
#brew cask install fork
# brew cask install 1password
# brew cask install chromium
# brew cask install imageoptim
# brew cask install alfred
# brew cask install encryptme
# brew cask install hex-fiend
