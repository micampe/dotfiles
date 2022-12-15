#!/usr/bin/env bash

BREW_PREFIX="/opt/homebrew"

# exit if any command fails
set -e

# Homebrew
if [[ ! -f $BREW_PREFIX/bin/brew ]]; then
    echo "Installing homebrew..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing homebrew packages..."
$BREW_PREFIX/bin/brew bundle --file=$(dirname $(realpath $0))/Brewfile

# dotfiles
echo "Setting up dotfiles..."

# Vim
MINPAC="$HOME/.vim/pack/minpac/opt/minpac"
if [[ ! -d $MINPAC && ! -L $MINPAC ]]; then
    echo "Installing vim package manager..."
    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
fi

echo "Updating vim plugins..."
sleep 1
vim +PackUpdate

echo "Setting user defaults..."

# Terminall shell
defaults write com.apple.Terminal Shell /opt/homebrew/bin/fish

# Trackpad dragging and tap to click
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Hot Corners
# Lock Screen
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0
# Disable Screen Saver
defaults write com.apple.dock wvous-tl-corner -int 6
defaults write com.apple.dock wvous-tl-modifier -int 0
# Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 64

# Keyboard Equivalents
defaults write -g NSUserKeyEquivalents -dict-add Zoom "@^z"

echo "Some defaults require the session to be restarted."
