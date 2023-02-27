set -g -x XDG_CONFIG_HOME ~/.config

switch (uname)
  case Darwin
    /opt/homebrew/bin/brew shellenv | source
end

set -l config_files aliases env secret_env

for file in $config_files
    test -f $XDG_CONFIG_HOME/fish/$file.fish && source $XDG_CONFIG_HOME/fish/$file.fish
end

if test (which starship)
  starship init fish | source
end

if test (which zoxide)
  zoxide init fish | source
end

switch (uname)
  case Darwin
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

