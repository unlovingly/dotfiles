function fish_prompt
  set -g git_info
  set -g job_info
  set -g vi_mode

  set -l last_status $status

  # Colours
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l magenta (set_color magenta)
  set -l white (set_color white)
  set -l normal (set_color normal)

  # Unconditional stuff
  set -l path $blue(pwd | sed "s:^$HOME:~:")
  set -l basic_prompt $yellow(whoami)$normal" at "$green(hostname -s)$normal" in "$blue$path" "

  # Prompt
  set -l prompt
  set -l UID (id -u $USER)

  # Last command
  set -l status_info ""

  fish_prompt_git
  fish_prompt_job
  fish_prompt_vi_mode

  if [ $last_status -ne 0 ]
    set status_info "$red""command failed with status: $last_status"
  end

  if [ "$UID" = "0" ]
    set prompt "$red# "
  else
    set prompt "$normal$vi_mode% "
  end

  # WTB: time spend on last command (if ≥ 1s)

  ##################################################
  # Output
  if [ -n $status_info ]
    echo -s $status_info
  end

  fish_prompt_rprint "$basic_prompt$git_info" $job_info

  echo -n -s $prompt
  set_color normal

  set -e git_info (fish_prompt_git)
  set -e job_info (fish_prompt_job)
  set -e vi_mode (fish_prompt_vi_mode)
end

function fish_prompt_git
  if [ (command git rev-parse --is-inside-work-tree ^/dev/null) ]
    # Get the current branch name/commit
    set -l git_branch_name (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    if [ -z $git_branch_name ]
      set git_branch_name (command git show-ref --head -s --abbrev | head -n1 2> /dev/null)
    end

    # Unconditional git component
    set git_info "$normal""on $white$git_branch_name"

    if [ (command git status -s --ignore-submodules=dirty | wc -l) -gt 0 ]
      set git_info "$git_info$yellow*"
    end

    set git_info "$git_info "
  end
end

function fish_prompt_job
  set -l job_count (jobs -c | wc -l | awk '{ print $1; }')

  if [ $job_count -gt 0 ]
    if [ $job_count -eq 1 ]
      set job_info "$magenta""($job_count job)"
    else
      set job_info "$magenta""($job_count jobs)"
    end
  end
end

function fish_prompt_rprint --description 'Prints first argument left-aligned, second argument right-aligned, newline'
  if [ (count $argv) = 1 ]
    echo -s $argv
  else
    set -l arglength (echo -n -s "$argv[1]$argv[2]" | perl -le 'while (<>) {
    s/ \e[ #%()*+\-.\/]. |
      (?:\e\[|\x9b) [ -?]* [@-~] | # CSI ... Cmd
      (?:\e\]|\x9d) .*? (?:\e\\|[\a\x9c]) | # OSC ... (ST|BEL)
      (?:\e[P^_]|[\x90\x9e\x9f]) .*? (?:\e\\|\x9c) | # (DCS|PM|APC) ... ST
      \e.|[\x80-\x9f] //xg;
    print;
  }' | awk '{printf length;}')

    set -l termwidth (tput cols)

    set -l padding
    if [ $arglength -lt $termwidth ]
      set padding (printf "%0"(math $termwidth - $arglength)"d"|tr "0" " ")
    end

    echo -s "$argv[1]$padding$argv[2]"
  end
end

function fish_prompt_vi_mode
  switch $fish_bind_mode
    case default
      set vi_mode '[n] '
    case insert
      set vi_mode '[i] '
    case visual
      set vi_mode '[v] '
    case replace_one
      set vi_mode '[r] '
  end
end
