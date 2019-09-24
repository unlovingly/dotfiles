set -g -x XDG_CONFIG_HOME ~/.config

source $OMF_CONFIG/aliases.fish
source $OMF_CONFIG/env.fish

# for HOMEBREW_GITHUB_API_TOKEN
source $OMF_CONFIG/secret_env.fish

status --is-interactive && source (anyenv init - | source)