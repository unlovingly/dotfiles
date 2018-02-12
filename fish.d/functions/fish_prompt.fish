function fish_prompt
  set -l git_info (fish_prompt_git)
  set -l vi_mode (fish_prompt_vi_mode)

  set -l last_status $status

  # TODO: shorten path if that too long
  set -l basic_prompt (whoami)" at "(set_color yellow)(prompt_hostname)(set_color normal)" in "(set_color blue)(prompt_pwd)(set_color normal)

  set -l prompt $vi_mode

  set -l status_info ""

  if [ $last_status -ne 0 ]
    set status_info (set_color red)"command failed with status: $last_status"(set_color normal)
  end

  if [ (id -u $USER) -eq 0 ]
    set prompt (set_color red)"$prompt# "(set_color normal)
  else
    set prompt "$prompt% "
  end

  if [ -n $status_info ]
    echo -s $status_info
  end

  fish_prompt_print_first_line $basic_prompt $git_info

  echo -n -s $prompt
end

function fish_prompt_git
  if [ (command git rev-parse --is-inside-work-tree ^/dev/null) ]
    set -l result
    set -l git_branch_name (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')

    if [ -z $git_branch_name ]
      set git_branch_name (command git show-ref --head -s --abbrev | head -n1 2> /dev/null)
    end

    # Unconditional git component
    set result "on "(set_color white)"$git_branch_name"

    if [ (command git status -s --ignore-submodules=dirty | wc -l) -gt 0 ]
      set result "$result"(set_color yellow)"*"
    end

    echo "$result"(set_color normal)
  end
end

function fish_prompt_print_first_line --description 'Prints first argument left-aligned, second argument right-aligned, newline'
  if [ (count $argv) = 1 ]
    echo -s $argv
  else
    set -l left $argv[1]
    set -l right $argv[2]
    # remove ANSI color
    set -l arglength (string length (string replace -ra '\x1b.*?[mGKH]' '' "$left$right"))
    set -l padding

    if [ $arglength -lt $COLUMNS ]
      # don't know the reason why `set_color normal` counted as the character
      set padding (string repeat --count (math $COLUMNS - $arglength + 2 + 1) " ")
    end

    echo -s "$left$padding$right"
  end
end

function fish_prompt_vi_mode
  switch $fish_bind_mode
    case default
      echo '[n] '
    case insert
      echo '[i] '
    case visual
      echo '[v] '
    case replace_one
      echo '[r] '
  end
end