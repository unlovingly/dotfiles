set -g -x EDITOR nvim
set -g -x FZF_DEFAULT_OPTS --exact --layout=reverse --height 15%
set -g -x LANG ja_JP.UTF-8
set -g -x LC_ALL ja_JP.UTF-8
set -g -x LC_CTYPE ja_JP.UTF-8
set -g -x LC_MESSAGES ja_JP.UTF-8
#set -g -x LS_COLORS (vivid generate solarized-dark)
set -g -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -g -x GPG_TTY (tty)

set -g __fish_git_prompt_show_informative_status 'yes'
set -g __fish_git_prompt_showcolorhints 'yes'

set -g __fish_git_prompt_char_cleanstate "x"
set -g __fish_git_prompt_char_dirtystate "*" "+"
set -g __fish_git_prompt_char_invalidstate "#" "X"
set -g __fish_git_prompt_char_stagedstate "+" "o"
set -g __fish_git_prompt_char_untrackedfiles "%" ".."
set -g __fish_git_prompt_char_upstream_ahead ">" ">>"
set -g __fish_git_prompt_char_upstream_behind "<" "<<"
