# https://github.com/brandonweiss/pure.fish

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch 242
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream cyan

# Git Characters
set __fish_git_prompt_char_dirtystate '● '
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⬈'
set __fish_git_prompt_char_upstream_behind '⬋'
set __fish_git_prompt_char_upstream_diverged '⬋⬈'

function fish_prompt
  set -l last_status $status
  set -l normal (set_color normal)
  set -l cwd_color (set_color blue)
  set -l status_color (set_color magenta)
  set -l login_color (set_color yellow)
  set -l suffix '❯ '
  set -l prefix ''

  set -lx fish_prompt_pwd_dir_length 0

  if set -q SSH_TTY
    set prefix $login_color (whoami) '@' (hostname) ' '
  end

  if test $last_status -ne 0
    set status_color (set_color brred)
    set suffix '✕ '
  end

  echo
  echo -s $cwd_color (prompt_pwd) (fish_vcs_prompt ' %s')
  echo -s -n $prefix $status_color $suffix $normal
end
