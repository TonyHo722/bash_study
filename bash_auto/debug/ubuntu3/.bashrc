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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# Ubuntu3 after move to SSD2T - start
source /SSD2T/opt/Xilinx/Vivado/2022.1/settings64.sh
#source /SSD2T/opt/Xilinx/Vivado/2022.2/settings64.sh
# Ubuntu3 after move to SSD2T - end

#source xilinx Vitis/XRT
#source /tools/Xilinx/Vitis/2020.2/settings64.sh
#source /opt/xilinx/xrt/setup.sh

# source for kv260-vitis
#source /tools/Xilinx/Vivado/2020.2/settings64.sh
#source /tools/Xilinx/Vivado/2021.1/settings64.sh
#source /SSD2T/opt/Xilinx/Vivado/2022.1/settings64.sh
#source /media/willychiang/SSD2T/tools3/Xilinx/Vivado/2022.2/settings64.sh


# for FINN
#source /tools/Xilinx/Vivado/2020.1/settings64.sh
#export FINN_XILINX_PATH=/tools/Xilinx
#export FINN_XILINX_VERSION=2020.1
#export FINN_HOST_BUILD_DIR=/home/tonyho/build
#export VIVADO_PATH=/tools/Xilinx/Vivado/2020.1
#export PYNQ_IP=192.168.2.106
#export PYNQ_PORT=22
#export PYNQ_BOARD=Pynq-Z2

#export PLATFORM_REPO_PATHS=/opt/xilinx/platforms

export PATH=$PATH:/opt/riscv/bin
#export PATH="/home/tonyho/workspace/rocket-chip/rocket-tools/riscv-gnu-toolchain/bin:$PATH"
#export RISCV=/home/tonyho/workspace/rocket-chip/rocket-tools/riscv-gnu-toolchain
export PATH="$PATH:/home/tonyho/.local/share/coursier/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tonyho/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tonyho/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tonyho/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tonyho/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias vtags="python /opt/vtags-3.11/vtags.py"
alias fault='docker run -tiv `pwd`:`pwd` -w `pwd` --rm ghcr.io/aucohl/fault:latest fault'

# for caravel-lab
export PATH=$PATH:~/.local/bin



# Tony's alias 20230902
## common
alias gits='git status'
alias gitst='git stash'
alias gitb='git branch'
alias gitbd='git branch -d'
alias gitba='git branch -a'
alias gitbav='git branch -a -v'
alias gitd='git diff'
alias gitr='git remote -v'
alias gitl='git log -5'
alias gitl1='git log --oneline -5'
alias gitldog='git log --decorate --oneline --graph'
alias gitladog='git log --all --decorate --oneline --graph'

alias cd..='cd ..'

## Linux only

alias export2022='export | grep "2022"'
alias sb='source ~/.bashrc'
alias sbt='source ~/.bashrc_tony'
alias vib='vi ~/.bashrc'
alias catb='cat ~/.bashrc'
alias catbg='cat ~/.bashrc | grep'
alias vit='vi ~/.bashrc_tony'

alias l='ls'
alias lm='ls -l | more'
alias lsd='ls -d */'
alias md='mkdir'
alias rd='rmdir'

