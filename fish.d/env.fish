set -g -x EDITOR nvim
set -g -x LANG ja_JP.UTF-8
set -g -x LC_ALL ja_JP.UTF-8
set -g -x LC_CTYPE ja_JP.UTF-8
set -g -x LC_MESSAGES ja_JP.UTF-8
set -g -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -g -x GPG_TTY (tty)
