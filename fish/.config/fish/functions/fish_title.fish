function fish_title
  set -q argv[1]; or set argv fish
  set -lx fish_prompt_pwd_dir_length 3
  echo $argv (prompt_pwd)
end
