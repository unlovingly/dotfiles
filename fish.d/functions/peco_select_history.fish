function peco_select_history --description "Select command from history"
    history | peco --select-1 | read -l line
    and commandline $line

    commandline -f repaint
end