function fish_title
  set -lx fish_prompt_pwd_dir_length 12
  set -l max_title_len 30
  if test (status current-command) = 'fish'
    echo (prompt_pwd)
  else if test "(string length $argv) -gt $max_title_len"
    set -l ellipsis \u2026
    set -l title (string trim (string sub -l $max_title_len $argv))$ellipsis
    echo $title
  else
    echo $argv
  end
end
