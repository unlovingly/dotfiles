function peco_execute_from_history --description "Execute command from history"
  history | peco --select-1 | read -l h; and eval $h

  commandline -f repaint
end
