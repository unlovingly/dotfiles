function fish_user_key_bindings
    fish_vi_key_bindings
    fzf_key_bindings

    bind -e -M insert \ce
    bind -e -M insert \cr
    bind -e -M default \cr
    bind -e \cr

    bind -M insert \ce select_repository
    bind -m insert \cr change_directory_to_repositorys_root
    bind -M insert \cr select_history
    bind -M default -m insert \cr execute_from_history
end
