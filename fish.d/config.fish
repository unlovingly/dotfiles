set -g ANDROID_HOME /usr/local/opt/android-sdk
set -g GOPATH ~/.local/go
set -g JAVA_HOME /usr/libexec/java_home
set -g NODE_PATH /usr/local/lib/node_modules

set -g fish_key_bindings rebind_keys

set -g -x PATH /usr/local/bin $GOPATH/bin ~/.composer/vendor/bin ~/.cargo/bin $PATH

# for HOMEBREW_GITHUB_API_TOKEN
if set -q XDG_CONFIG_HOME
    set -l p $XDG_CONFIG_HOME/fish/env.fish
    test -f $p && source $p
else
    set -l p ~/.config/fish/env.fish
    test -f $p && source $p
end

source ~/.config/fish/aliases.fish