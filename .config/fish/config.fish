abbr -a -- python python3
abbr -a -- www 'python3 -m http.server'
abbr -a -- rsync 'rsync -aihz --exclude .DS_Store --exclude ".git*" --stats'
abbr -a -- lowpowermode 'sudo pmset -b lowpowermode'
abbr -a -- lazydot 'lazygit --work-tree=$HOME --git-dir=$HOME/src/dotfiles.git'
abbr -a -- dotui 'gitui --workdir=$HOME --directory=$HOME/src/dotfiles.git'

abbr -a -- - 'cd -'

abbr -a -- l ls
abbr -a -- l1 'ls -1'
abbr -a -- la 'ls -A'
abbr -a -- ll 'ls -oh'
abbr -a -- lla 'ls -oAh'

set --prepend PATH "/opt/homebrew/bin"
set --prepend PATH "$HOME/.local/bin"
set --prepend PATH "$HOME/.local/share/cargo/bin"
set --prepend PATH "$HOME/bin"

set --export FZF_DEFAULT_OPTS '
    --color hl:14,hl+:14
    --color info:8,prompt:8,header:4,spinner:11
'

set --export EDITOR vim
set --export HOMEBREW_CASK_OPTS "--appdir=~/Applications/"
set --export HOMEBREW_DISPLAY_INSTALL_TIMES 1
set --export HOMEBREW_NO_ENV_HINTS 1
set --export LC_ALL "en_US.UTF-8"
set --export LESS "--hilite-unread --window=-4 --quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --no-init"
set --export PAGER less
set --export VISUAL vim
set --export BROWSER open

# XDG
set --export XDG_CACHE_HOME "$HOME/.cache"
set --export XDG_CONFIG_HOME "$HOME/.config"
set --export XDG_DATA_HOME "$HOME/.local/share"
set --export XDG_STATE_HOME "$HOME/.local/state"

set --export CARGO_HOME "$XDG_DATA_HOME/cargo"
set --export DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set --export HISTFILE "$XDG_STATE_HOME/bash/history"
set --export IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set --export LESSHISTFILE "$XDG_STATE_HOME/less/history"
set --export PYENV_ROOT "$XDG_DATA_HOME/pyenv"
set --export RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set --export SQLITE_HISTORY "$XDG_CACHE_HOME/sqlite_history"
