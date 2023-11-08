# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#  ---------------------------------------------------------------------------
#  Bash profile courtesy of https://natelandau.com/my-mac-osx-bash_profile/
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Colours! Generated using method mentioned in link below.
#   https://misc.flogisoft.com/bash/tip_colors_and_formatting -- This shows how to format colours and style of font!
#   Shell script that visualizes colours is called 256-colors.sh
#   ------------------------------------------------------------
    green="\[\033[0;32m\]"
    blue="\[\033[0;34m\]"
    yellow="\[\033[0;93m\]"
    reset="\[\033[0m\]"
    pink="\[\033[0;95m\]"
    colour="\[\033[0m\]"
    light_green="\[\e[38;5;121m\]"
    bluish="\[\e[1m\[\e[38;5;4m\]" #same as blue in temrinal settings
    light_yellow="\[\e[93m\]"
    lighter_yellow="\[\e[38;5;11m\]"
    macos_orange="\[\e[38;5;222m\]"

#   Enable tab completion for git
#   ------------------------------------------------------------
    source $HOME/.git/git-completion.bash					                                                       	# File included in repository enables tab completion for git commands

#   Change Prompt
#   ------------------------------------------------------------
    source $HOME/.git/git-prompt.sh							                                                       	# You need to import that for (__git_ps1) to work properly, file included in repository
    export GIT_PS1_SHOWDIRTYSTATE=1	                                                                        # Required for git
    export PS1="$light_green\h$lighter_yellow\$(__git_ps1) $blue\W $reset$ "
#   export PS1='\[\e]0;\u@\h: \w\a\]\[\e[32;1m\]\u@\h:\w \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'  # Other version of PS1

#   '\u' adds the name of the current user to the prompt
#   '\$(__git_ps1)' adds git-related stuff
#   '\W' adds the name of the current directory

#   Set Paths
#   ------------------------------------------------------------
#   export PATH="/directory:$PATH"                                  # Exports a path in front (higher priority)
#   export PATH=/path1:/path2:/path3:/path4                         # Exports all the paths
#   export PATH="$PATH:/directory"                                  # Exports a path in end (lower priority)
    export PATH="$PATH:$HOME/local/scripts"

#   Source custom commands/programs
#   ------------------------------------------------------------
#   source /directory/to/custom/commands

#   Set Default Editor (change 'nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR="/usr/bin/nvim -w"

#   Set Visual Editor (to edit crontab)
#   ------------------------------------------------------------
    export VISUAL="/usr/bin/nvim"

#   Source fzf keybindings and fuzzy auto completion
#   ------------------------------------------------------------
    [ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
    


#   Set default blocksize for ls, df, du
#   from http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   More on customizing LSCOLORS http://www.linux-sxs.org/housekeeping/lscolors.html
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    alias ls='ls --color'

#   Set the terminal programs language to english
#   ------------------------------------------------------------
    unset LC_ALL
    export LC_MESSAGES=C



#   -----------------------------
#   2. MAKE TERMINAL BETTER
    export LC_MESSAGES=C



#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
alias sudo='sudo '                                                                            # Make sudo aplicable for aliases
alias mkdir='mkdir -pv'                     				                                  # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp --color'                       				                          # Preferred 'ls' implementation
alias less='less -FSRXc'                    				                                  # Preferred 'less' implementation
alias ~='cd ~/'									                                              # Change directory to home
alias cd..='cd ../'                         				                                  # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           				                                  # Go back 1 directory level
alias .2='cd ../../'                        				                                  # Go back 2 directory levels
alias .3='cd ../../../'                     				                                  # Go back 3 directory levels
alias .4='cd ../../../../'                  	   			                                  # Go back 4 directory levels
alias .5='cd ../../../../../'               				                                  # Go back 5 directory levels
alias .6='cd ../../../../../../'            				                                  # Go back 6 directory levels
alias edit=nvim                            				                                      # edit:         Opens any file in sublime editor
alias vim=nvim
alias finder='xdg-open'                 			                                          # finder:       Opens current directory in Linux GUI file manager
alias which='type -all'                     				                                  # which:        Find executables
alias show_path='echo -e ${PATH//:/\\n}'         		                                      # path:         Echo all executable Paths
alias show_options='shopt'                  				                                  # Show_options: display bash options settings
alias cic='set completion-ignore-case On'   				                                  # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        				                                  # mcd:          Makes new Dir and jumps inside
trash(){ x=''; [[ $1 = -s ]] && { x=sudo; shift; }; $x mv "$@" ~/.local/share/Trash/files; }  # trash:        Moves a file to the Ubuntu trash
alias DT='tee ~'    				                                                          # DT:           Pipe content to file in home directory

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }           			   		   					                   # zipf:         To create a ZIP archive of a folder
zipfe () { zip -er "$1".zip "$1" ; } 	    				 		 					               # zipfe 	       To create an ecrypted ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'       			 		 					                   # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         				 		 					               # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         				 							               # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'					 		 					                   # make10mb:     Creates a file of 10mb size (all zeros)
enc () { openssl enc -aes-256-cbc -e -in "$1" -out enc_"$1" ; rm -fr "$1" ; mv enc_"$1" "$1" ; }       # enc: 	       Encrypts a file with password using 256-bit encryption
dec () { openssl enc -aes-256-cbc -d -in "$1" -out dec_"$1" ; rm -fr "$1" ; mv dec_"$1" "$1" ; }       # dec:		   Decrypts a 256-bit encrypted file

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4. SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ---------------------------
#   6. NETWORKING
#   ---------------------------
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   							# lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              							# ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              							# ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        							# openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  							# showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   ---------------------------------------
#   7. REMINDERS & NOTES
#   ---------------------------------------

