set -g ANDROID_HOME /usr/local/opt/android-sdk
set -g GOPATH ~/.local/go
set -g JAVA_HOME (/usr/libexec/java_home -v 1.9)
set -g NODE_PATH /usr/local/lib/node_modules

set -g fish_key_bindings rebind_keys

set -g -x PATH /usr/local/bin $PATH $GOPATH/bin ~/.composer/vendor/bin

# for HOMEBREW_GITHUB_API_TOKEN
if set -q XDG_CONFIG_HOME
  source $XDG_CONFIG_HOME/fish/env.fish
else
  source ~/.config/fish/env.fish
end
