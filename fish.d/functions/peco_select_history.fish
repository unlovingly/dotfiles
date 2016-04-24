function peco_select_history --description "Change current directory to hisotry\'s root that managed by ghq"
    history | peco --select-1 | read -l line; commandline $line

    commandline -f repaint
end
