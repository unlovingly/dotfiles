set -g -x XDG_CONFIG_HOME ~/.config

/opt/homebrew/bin/brew shellenv | source

set -l config_files aliases env secret_env

for file in $config_files
    test -f $XDG_CONFIG_HOME/fish/$file.fish && source $XDG_CONFIG_HOME/fish/$file.fish
end

starship init fish | source
zoxide init fish | source


source /opt/homebrew/opt/asdf/libexec/asdf.fish
