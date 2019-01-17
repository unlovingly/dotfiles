function register_alias --description "Create alias" --argument-names base_command target command
    if type -q $base_command
        alias $target=$command
    end
end