function fish_title
  set -lx fish_prompt_pwd_dir_length 3
  if test (status current-command) = 'fish'
    echo (prompt_pwd)
  else
    echo $argv
  end
end
