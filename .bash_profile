# .bash_profile is for Mac OS.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

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

# make mac os x colorful in terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     eval "`dircolors -b`"
#     alias ls='ls --color=auto'
# fi

# make Vim as the default editor.
export EDITOR=/usr/bin/vim

# My alias list
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias search='brew search'
alias show='brew info'
alias install='brew install'
alias remove='brew uninstall'
alias au='brew update && brew upgrade'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ll='ls -lh'
alias la='ls -lha'
alias gls='gls --color=auto'
alias less='/usr/share/vim/vim73/macros/less.sh'
alias irc='irssi -c irc.freenode.net -p 7000 -n pityonline'
alias gd='~/scripts/git-dropbox.sh'
alias gcc='gcc -Wall'
alias chmod='chmod -v'
alias CDA='shntool split -t "%n-%t" -f *.cue -o wav *.ape'
alias CDF='shntool split -t "%n-%t" -f *.cue -o wav *.flac'
alias vps='ssh pityonline.info'
alias vpn='sudo service openvpn restart'
alias mou='/Applications/Mou.app/Contents/MacOS/Mou'
alias mplayer='/Applications/MPlayerX.app/Contents/MacOS/MPlayerX'
alias gimp='/Applications/GIMP.app/Contents/MacOS/GIMP'
alias kindle='/Applications/Kindle.app/Contents/MacOS/Kindle'
alias gst='~/Repo/gitstats/gitstats'
# Mysql alias
alias mysqlstart='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias download_history="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias flush='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

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
# export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/Cellar/ruby/1.9.3-p327/bin:$PATH
export PATH=~/Repo/android-sdk/tools:$PATH
export PATH=~/Repo/android-sdk/platform-tools:$PATH

# Git completion
source /usr/local/Cellar/git/1.8.0/etc/bash_completion.d/git-completion.bash
