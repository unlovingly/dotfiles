function rebind_keys
    fish_vi_key_bindings

    bind -e -M insert \ce
    bind -e -M insert \cr
    bind -e \cr

    bind -M insert \ce peco_select_repository
    bind -m insert \cr change_directory_to_repositorys_root
    bind -M insert \cr peco_select_history
end
