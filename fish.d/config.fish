set -g -x XDG_CONFIG_HOME ~/.config

sourcess $XDG_CONFIG_HOME/fish/aliases.fish
sourcess $XDG_CONFIG_HOME/fish/env.fish

# for HOMEBREW_GITHUB_API_TOKEN
sourcess $XDG_CONFIG_HOME/fish/secret_env.fish


status --is-interactive && sourcess (anyenv init - | source)
