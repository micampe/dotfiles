fish_add_path --prepend --move /opt/homebrew/bin
fish_add_path --prepend --move ~/.local/bin
fish_add_path --prepend --move ~/.cargo/bin

if command -q brew
    set --export HOMEBREW_CASK_OPTS "--appdir=/Applications"
end
