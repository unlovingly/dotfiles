# Requirements

- fish shell (3.0.0 <=)
- homebrew

# Installation

```sh
% git clone git://github.com/unlovingly/dotfiles.git ~/.files
```

```sh
% cd ~/.files
```

```sh
% brew bundle
% task install
```

## Environment Variables

```fish
% cat ~/.config/fish/env.fish
#!/usr/bin/env fish
set -g -x EDITOR code
set -g -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -g -x XDG_CONFIG_HOME ~/.config
```

# Set aliases

```fish
% cat ~/.config/fish/aliases.fish
register_alias "bat" "cat" "bat"
register_alias "exa" "l" "exa -g -l -a --group-directories-first --git-ignore -h --git"
```
