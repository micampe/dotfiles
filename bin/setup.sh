#!/usr/bin/env bash

# Install:
# curl -L https://github.com/micampe/dotfiles/raw/master/bin/setup.sh | bash

set -o errexit
# set -o verbose

SCRIPT_PATH="$(dirname "$(realpath "$0")")"

# dotfiles
printf "Setting up dotfiles...\n"
GITDIR=$HOME/src/dotfiles.git
WORKTREE=$HOME
mkdir -p "$GITDIR"
git clone --bare --quiet git@github.com:micampe/dotfiles "$GITDIR"
# bare clone doesn't set the default fetch refspec
# https://stackoverflow.com/questions/47192444/git-branch-all-not-showing-remote-branch
git --git-dir="$GITDIR" config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git --git-dir="$GITDIR" --work-tree="$WORKTREE" reset --quiet master

# Vim
printf "\nSetting up vim...\n"
MINPAC="$HOME/.vim/pack/minpac/opt/minpac"
if [[ ! -d $MINPAC && ! -L $MINPAC ]]; then
    printf "Installing vim package manager...\n"
    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
else
    printf "minpac already installed\n"
fi

printf "\nUpdating vim plugins...\n"
sleep 1
vim +PackUpdate

# Homebrew
printf "\n"
if [[ $(uname) = "Darwin" ]]; then
    BREW_PREFIX="/opt/homebrew"
    if [[ ! -f $BREW_PREFIX/bin/brew ]]; then
    	printf "Installing homebrew...\n"
    	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
    	printf "homebrew already installed\n"
    fi

    printf "Installing homebrew packages...\n"
    $BREW_PREFIX/bin/brew bundle --file="$SCRIPT_PATH"/Brewfile
    printf "Adding homebrew bin to %s\n" "$PATH"
    sudo launchctl config user path "$(brew --prefix)/bin:${PATH}"
fi

FISH_PATH=$(command -a fish)
if [[ -n "$FISH_PATH" ]]; then
    printf "Adding fish to /etc/shells\n"
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi

# macOS user defaults
if [[ $(uname) = "Darwin" ]]; then
    printf "\nSetting user defaults...\n"

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
fi
