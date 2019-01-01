function select_repository --description "Change current directory to repository\'s root that managed by ghq"
    ghq list -p | fzf --layout=reverse --select-1 | read -l line && builtin cd $line

    commandline -f repaint
end