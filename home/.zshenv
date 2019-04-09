#!/usr/bin/env zsh

########################################
# environment variables
########################################
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export FCEDIT=nvim
export PAGER=less
export SHELL=zsh
export TERM=xterm-256color

########################################
# path
########################################
setopt no_global_rcs
if [ -L /sbin ]; then
    export path=(/bin /usr/bin)
fi
export path=(
    /usr/local/bin(N-/)
    ${path}
)

########################################
# configuration path
########################################
export XDG_CONFIG_HOME=${HOME}/.config
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh
