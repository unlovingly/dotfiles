function register_alias --description "Create alias"
    if type -q $argv[1]
        alias $argv[2]=$argv[1]
    end
end