# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

alias ls='~/luke-vimrc/ls.sh'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
alias dev1='sshhc hybrid@10.0.3.201'
alias dev2='sshhc hybrid@10.0.3.202'
alias dev3='sshhc hybrid@10.0.3.203'

alias basement1='sshhc hybrid@192.168.1.201'
alias basement2='sshhc hybrid@192.168.1.202'
alias basement3='sshhc hybrid@192.168.1.203'
alias basement4='sshhc hybrid@192.168.1.204'
alias basement5='sshhc hybrid@192.168.1.205'
alias basement6='sshhc hybrid@192.168.1.206'

alias jailstest='ssh hybrid@10.0.3.210'

alias dev1e='ssh hybrid@dev1-e.hybridcluster.net'
alias dev2e='ssh hybrid@dev2-e.hybridcluster.net'
alias dev3e='ssh hybrid@dev3-e.hybridcluster.net'

alias dev1t='ssh hybrid@dev1.hybridcluster.net'
alias dev2t='ssh hybrid@dev2.hybridcluster.net'
alias dev3t='ssh hybrid@dev3.hybridcluster.net'

alias dev1b='ssh hybrid@192.168.1.207'
alias dev2b='ssh hybrid@192.168.1.208'
alias dev3b='ssh hybrid@192.168.1.209'
alias dev4b='ssh hybrid@192.168.1.210'

alias devina='ssh luke@devina.gotdns.com'

alias crux='ssh luke@127cr.net'
alias dc='ssh luke@digital-crocus.com'
alias node1='ssh hybrid@node1.digital-crocus.com'
alias node2='ssh luke@node2.digital-crocus.com'
alias node3='ssh hybrid@node3.digital-crocus.com'
alias node0='ssh luke@node0.hybridcluster.net'
alias buildslave='ssh luke@buildslave.hybridcluster.net'
alias jailmaster='ssh luke@jailmaster.hybridcluster.net'

alias node4='ssh hybrid@91.209.244.194'
alias node5='ssh hybrid@91.209.244.195'
alias node6='ssh hybrid@91.209.244.196'

alias monitors='ssh root@monitors.cloudmanaged.com'
alias pulldev1='git pull hybrid@10.0.3.201:/opt/HybridCluster'
alias pulldev2='git pull hybrid@10.0.3.202:/opt/HybridCluster'
alias pulldev3='git pull hybrid@10.0.3.203:/opt/HybridCluster'
alias sagi='sudo aptitude install'

alias swdev1='ssh luke@192.168.0.201'
alias cm1='ssh luke@cm1.server.cloudmanaged.com'
alias cm2='ssh luke@cm2.server.cloudmanaged.com'
alias mg1='ssh luke@mg1.server.cloudmanaged.com'
alias mg1west='ssh luke@192.168.0.12'
alias mg2='ssh luke@mg2.server.cloudmanaged.com'

alias tucv1='ssh simpleweb@twistd-tuc-v1.jail.cloudmanaged.com'
alias tucv2='ssh simpleweb@twistd-tuc-v2.jail.cloudmanaged.com'
alias monitorsv1='ssh simpleweb@apache-monitors-v1.jail.cloudmanaged.com'
alias monitorsv2='ssh simpleweb@apache-monitors-v2.jail.cloudmanaged.com'
alias sshtd='ssh -i ~/TweetDeck/tweetdeck-backend/credentials/key-restapi-instance'
alias sshhc='ssh -i ~/HybridDeployment/credentials/master_key'
alias ohc='cd /opt/HybridCluster'

alias myip="ifconfig |grep broadcast |cut -d ' ' -f 2"
alias cspass="cat ~/HybridDeployment/fabfile.py |grep @hybr"

alias reset='reset; tset -e^?'
alias imap='ssh -f -i ~/HybridDeployment/credentials/master_key hybrid@109.107.35.48 -L 2001:digital-crocus.com:143 -N'
alias smtp='ssh -f -i ~/HybridDeployment/credentials/master_key hybrid@109.107.35.48 -L 2000:digital-crocus.com:25 -N'
alias z='zfs list -t snapshot,filesystem -r hpool/hcfs'
alias io='sudo /usr/sbin/iostat -I -x -w 1'

export CLICOLOR=1
export PATH=/usr/local/mysql/bin:/home/luke/HybridCluster/bin:$PATH
export LS_COLORS="`echo $LS_COLORS |sed 's/di=[0-9]*;[0-9]*/di=01;34/; s/ow=[0-9]*;[0-9]*/ow=01;34/'`"

export PYTHONPATH=$PYTHONPATH:/opt/HybridCluster/src:/opt/HybridCluster/src/txmysql
export PYTHONPATH=$PYTHONPATH:/home/luke/HybridCluster/src:/home/luke/HybridCluster/src/txmysql:/home/luke/HybridCluster/src/txjsonrpc

if [ -f ~/TweetDeck/tweetdeck-api/access_keys.sh ]; then
    source ~/TweetDeck/tweetdeck-api/access_keys.sh
fi

export FTP_PASSIVE_MODE=1
#if [ "$PS1" ] ; then
#mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#echo $$ > /dev/cgroup/cpu/user/$$/tasks
#echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi
