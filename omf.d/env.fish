set -g -x PATH $GOPATH/bin $PATH
set -g -x EDITOR code
set -g -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -g -x LANG ja_JP.UTF-8

set -g GOPATH ~/.local/go
set -g JAVA_HOME /usr/libexec/java_home
set -g NODE_PATH /usr/local/lib/node_modules

set -g __fish_git_prompt_show_informative_status 'yes'
set -g __fish_git_prompt_showcolorhints 'yes'

set -g __fish_git_prompt_char_cleanstate "x"
set -g __fish_git_prompt_char_dirtystate "*" "+"
set -g __fish_git_prompt_char_invalidstate "#" "X"
set -g __fish_git_prompt_char_stagedstate "+" "o"
set -g __fish_git_prompt_char_untrackedfiles "%" ".."
set -g __fish_git_prompt_char_upstream_ahead ">" ">>"
set -g __fish_git_prompt_char_upstream_behind "<" "<<"

set -g -x $_FASD_AWK gawk

set -g -x FZF_CD_COMMAND "fasd -l -d"
set -g -x FZF_CD_OPTS "--no-sort"
set -g -x FZF_DEFAULT_OPTS "--exact --height=40% --layout=reverse --select-1"

set -g fish_key_bindings fish_vi_key_bindings