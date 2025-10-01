# enable brew autocompletion and disable that ridiculous emoji
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_EMOJI=1

# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# pyenv variables and init
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# know what system you are running config
export SYSTEM=$(uname -s)

# move config share state files to XDG base directories
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

