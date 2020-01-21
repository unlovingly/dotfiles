set -g -x XDG_CONFIG_HOME ~/.config

set -l config_files aliases env secret_env

for file in $config_files
    test -f $XDG_CONFIG_HOME/fish/$file.fish && source $XDG_CONFIG_HOME/fish/$file.fish
end

status --is-interactive && source (anyenv init - | source)
starship init fish | source
