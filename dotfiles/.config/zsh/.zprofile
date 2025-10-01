# know what system you are running config
SYSTEM=$(uname -s)
if [[ $SYSTEM != "Darwin" ]]; then
  SYSTEM=$(lsb_release -is)
fi
export $SYSTEM

# enable brew autocompletion and disable that ridiculous emoji
if [[ $SYSTEM == 'Darwin' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_NO_EMOJI=1
fi
# also use brew for Debian, apt has way too many outdated packages
if [[ $SYSTEM == 'Debian' ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export HOMEBREW_NO_EMOJI=1
fi

# set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# pyenv variables and init
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# move config share state files to XDG base directories
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

