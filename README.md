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
