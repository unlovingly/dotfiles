function select_history --description "Select command from history"
    history | fzf --layout=reverse --select-1 | read -l line && commandline $line

    commandline -f repaint
end