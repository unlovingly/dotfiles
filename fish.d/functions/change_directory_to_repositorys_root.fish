function change_directory_to_repositorys_root -d 'Change current directory to repository\'s root'
    if not git rev-parse --is-inside-git-dir ^ /dev/null
        return 0
    end

    if git rev-parse
        cd (git rev-parse --show-toplevel)
    end
end
