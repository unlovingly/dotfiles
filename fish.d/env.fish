#!/usr/bin/env fish
set -g -x EDITOR code
set -g -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -g -x XDG_CONFIG_HOME ~/.config

set -g __fish_git_prompt_show_informative_status 'yes'
set -g __fish_git_prompt_showcolorhints 'yes'

set -g __fish_git_prompt_char_cleanstate "x"
set -g __fish_git_prompt_char_dirtystate "*" "+"
set -g __fish_git_prompt_char_invalidstate "#" "X"
set -g __fish_git_prompt_char_stagedstate "+" "o"
set -g __fish_git_prompt_char_untrackedfiles "%" ".."
set -g __fish_git_prompt_char_upstream_ahead ">" ">>"
set -g __fish_git_prompt_char_upstream_behind "<" "<<"
