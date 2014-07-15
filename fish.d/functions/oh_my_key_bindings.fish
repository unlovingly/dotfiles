function oh_my_key_bindings
    fish_vi_key_bindings

    bind -e -M insert \ce
    bind -e -M insert \cr
    bind -e \cr

    bind -M insert \ce peco_select_repository force-repaint
    bind -m insert \cr change_directory_to_repositorys_root force-repaint
    bind -M insert \cr peco_select_history force-repaint
end
