#!/usr/bin/env bash

set -e

cd ~
git clone https://github.com/Homebrew/brew

brew install ack
brew install ag
brew install chisel
brew install exiftool
brew install fzf
brew install git
brew install icdiff
brew install tree
brew install vim

brew tap caskroom/cask

brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install daisydisk
brew cask install encryptme
brew cask install hex-fiend
brew cask install imageoptim
