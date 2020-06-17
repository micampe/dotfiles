#!/usr/bin/env bash

LOCAL="$HOME/.local"
STOWS="bin vim fish git shell ack ruby lldb ssh"

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
brew bundle

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

echo "Setting user defaults..."

# Trackpad dragging and tap to click
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Large mouse pointer
defaults write com.apple.universalaccess mouseDriverCursorSize -float 2.0

# ctrl-scroll to zoom the screen
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess closeViewSmoothImages -bool false

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
# Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 64

# Spaces
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults write -g AppleSpacesSwitchOnActivate -bool false

# Keyboard Equivalents
defaults write -g NSUserKeyEquivalents -dict-add Zoom "@^z"

echo "Some defaults require the session to be restarted."
