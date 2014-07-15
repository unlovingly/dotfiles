# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme numist

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins node php tmux

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set -x GOPATH ~/.local/go
set -x PATH /usr/local/bin $PATH $GOPATH/bin ~/.composer/vendor/bin
set -x NODE_PATH /usr/local/lib/node_modules
set -x GIT_EDITOR '/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
set -x ANDROID_HOME /usr/local/opt/android-sdk

set -g fish_key_bindings oh_my_key_bindings

alias vi    vim
alias vim   /Applications/MacVim.app/Contents/MacOS/Vim
