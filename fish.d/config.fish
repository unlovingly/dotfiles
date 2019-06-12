set -g ANDROID_HOME /usr/local/opt/android-sdk
set -g GOPATH ~/.local/go
set -g JAVA_HOME /usr/libexec/java_home
set -g NODE_PATH /usr/local/lib/node_modules

set -g fish_key_bindings rebind_keys

set -g -x PATH /usr/local/bin $GOPATH/bin ~/.composer/vendor/bin ~/.cargo/bin $PATH

# for HOMEBREW_GITHUB_API_TOKEN
if set -q XDG_CONFIG_HOME
    sourcess $XDG_CONFIG_HOME/fish/aliases.fish
    sourcess $XDG_CONFIG_HOME/fish/env.fish
    sourcess $XDG_CONFIG_HOME/fish/secret_env.fish
end


status --is-interactive
and sourcess (anyenv init -|psub)
