function execute_from_history --description "Execute command from history"
    history | fzf --exact --layout=reverse --select-1 | read -l h && eval $h

    commandline -f repaint
end