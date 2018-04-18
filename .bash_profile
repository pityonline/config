# .bash_profile is for Mac OS.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#function _update_ps1() {
#   export PS1="$(~/powerline-bash.py $?)"
#   }
#   export PROMPT_COMMAND="_update_ps1"

# export PS1='\e[01;31m\A \e[00m\e[01;32m\w\e[00m\$ ' 

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# 忽略重复的命令
# export HISTCONTROL=ignoredups
# 忽略由冒号分割的这些命令
export HISTIGNORE="[   ]*:&:bg:fg:exit:cd:ls:open"
# 设置保存历史命令的文件大小
export HISTFILESIZE=1000000
# 保存历史命令条数
export HISTSIZE=1000000
# 显示命令执行时间
export HISTTIMEFORMAT='%F %T '
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|Terminal*)
    PS1='\e[01;31m\A \e[00m\e[01;32m\w\e[00m\$ '
    ;;
*)
    ;;
esac
# make mac os x colorful in terminal
# export TERM=xterm-256color
export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
source "/usr/local/etc/grc.bashrc"

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     eval "`dircolors -b`"
#     alias ls='ls --color=auto'
# fi
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='-G'
    test -r ~/.dir_colors && eval "$(gdircolors -b ~/.dir_colors)" || eval "$(gdircolors -b)"
    eval `gdircolors ~/.dir_colors`
fi
# make Vim as the default editor.
export EDITOR=/usr/bin/vim

# Colorful Man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# 解决 ssh 乱码
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Paths
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
# export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# Git completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Alias
source $HOME/.alias
eval "$(hub alias -s)"
