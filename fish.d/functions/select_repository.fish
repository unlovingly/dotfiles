function select_repository --description "Change current directory to repository\'s root that managed by ghq"
    set -l names (ghq list --unique)

    ghq list --unique | \
    fzf --preview="ghq list --full-path {}" --preview-window=right:80% --select-1 | \
    read -l line && cd (ghq list --full-path $line | head)

    commandline -f repaint
end
