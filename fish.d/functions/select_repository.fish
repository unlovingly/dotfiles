function select_repository --description "Change current directory to repository\'s root that managed by ghq"
    set -l names (ghq list --unique)

    ghq list --unique | \
    sk --preview="ghq list --full-path {} | head -n 1" --preview-window=right:80% --select-1 | \
    read -l line && cd (ghq list --full-path $line | head -n 1)

    commandline -f repaint
end
