function select_repository --description "Change current directory to repository\'s root that managed by ghq"
    set -l delimiter @,@
    set -l pathes (ghq list -p)
    set -l names (ghq list --unique)

    for n in (seq (count $pathes))
        set -a combined (string join $delimiter $pathes[$n] $names[$n])
    end

    printf '%s\n' $combined | \
    fzf --with-nth=2 --delimiter=$delimiter --preview="echo {1}" --preview-window=right:80% --select-1 | \
    read -l line && cd (string split $delimiter $line)[1]

    commandline -f repaint
end
