function peco_select_history -d 'Change current directory to hisotry\'s root that managed by ghq'
    if set -q $argv
        history | peco | read line; commandline $line
    else
        history | peco --query $argv | read line; commandline $line
    end
end
