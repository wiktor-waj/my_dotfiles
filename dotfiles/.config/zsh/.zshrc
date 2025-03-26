# Set Paths
export PATH="$PATH:$HOME/.local/scripts"
export FPATH="$HOME/.local/functions:$FPATH"
# ------------------------------------------------------------
# export PATH="/directory:$PATH"           # Exports a path in front (higher priority)
# export PATH="$PATH:/directory"           # Exports a path in end (lower priority)

# autoload functions from .local/functions all of them are symbolic links so
# load links instead of files
autoload -U $fpath[1]/*(@:t)

# Add color to terminal
# LSCOLORS generator https://geoff.greer.fm/lscolors/
# taken from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Because brew installs bash autocomplete for git every update it overrides
# zsh tab completion system. Remove it so zsh tab completion can be used
[ -e /opt/homebrew/share/zsh/site-functions/git-completion.bash ] && rm /opt/homebrew/share/zsh/site-functions/git-completion.bash
[ -e /opt/homebrew/share/zsh/site-functions/_git ] && rm /opt/homebrew/share/zsh/site-functions/_git

# Enable tab completion system
autoload -Uz compinit && compinit

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

# Formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Change Prompt
# Source git prompt and change settings
source $HOME/.local/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
# %(?.λ.%?) <- if return code (?) is 0 show lambda, else show %? (return code of
# previous command)
setopt PROMPT_SUBST ; PS1='%F{10}%(?.λ.%?)%F{11}$(__git_ps1 " (%s)") %F{12}%2~ %f%# '

# Set Default Editor
export EDITOR=nvim

# Set Visual Editor
export VISUAL=nvim

# Set pager (for man)
export PAGER='less -s -M +Gg'

# Point history file to .config/zsh
export HISTFILE="${ZDOTDIR}/history"

# Source aliases
source $HOME/.config/zsh/aliases
