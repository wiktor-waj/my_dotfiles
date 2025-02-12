# enable brew autocompletion and disable that ridiculous emoji
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_EMOJI=1

# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# pyenv variables and init
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
