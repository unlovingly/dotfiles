function peco_select_repository --description "Change current directory to repository\'s root that managed by ghq"
  ghq list -p | peco --select-1 | read -l line; builtin cd $line

  commandline -f repaint
end
