# enable brew autocompletion and disable that ridiculous emoji
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_EMOJI=1

# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# pyenv variables and init
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# move config share state files to XDG base directories
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"

