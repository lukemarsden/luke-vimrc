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

alias myip="ifconfig |grep broadcast |cut -d ' ' -f 2"

alias reset='reset; tset -e^?'
alias imap='ssh -f -i ~/HybridDeployment/credentials/master_key hybrid@109.107.35.48 -L 2001:digital-crocus.com:143 -N'
alias smtp='ssh -f -i ~/HybridDeployment/credentials/master_key hybrid@109.107.35.48 -L 2000:digital-crocus.com:25 -N'
alias z='zfs list -t snapshot,filesystem -r hpool/hcfs'
alias io='sudo /usr/sbin/iostat -I -x -w 1 |grep -v pass'
alias ack='ack-grep'

export CLICOLOR=1
#export PATH=/opt/pypy/bin:/usr/local/mysql/bin:/home/luke/HybridCluster/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/opt/HybridCluster/bin:$PATH
#export PATH=/usr/local/mysql/bin:/home/luke/HybridCluster/bin:/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/games:/usr/local/sbin:/opt/HybridCluster/bin:~/flocker-tutorial/bin:$PATH
export PATH=/usr/local/mysql/bin:/home/luke/HybridCluster/bin:/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/games:/usr/local/sbin:/opt/HybridCluster/bin:$PATH
export LS_COLORS="`echo $LS_COLORS |sed 's/di=[0-9]*;[0-9]*/di=01;34/; s/ow=[0-9]*;[0-9]*/ow=01;34/'`"

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export FTP_PASSIVE_MODE=1
#if [ "$PS1" ] ; then
#mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#echo $$ > /dev/cgroup/cpu/user/$$/tasks
#echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
shopt -s histappend
export PROMPT_COMMAND="history -a"
alias sshhc='ssh -p 2222 -i ~/HybridDeployment/credentials/master_key'

alias sagi='sudo apt-get install'
alias t='~/todo/todo.sh'
# Make a new line at the start of the file
alias todo="echo '0a

.
w' | ed ~/todo/todo.txt; vim ~/Todo.txt"
if [ -e /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi
export PYTHONDONTWRITEBYTECODE=1
export EDITOR=vim

# The next line updates PATH for the Google Cloud SDK.
export PATH=/Users/luke/google-cloud-sdk/bin:~/twisted-dev-tools/bin/:$PATH

# The next line enables bash completion for gcloud.
if [ -e /Users/luke/google-cloud-sdk/arg_rc ]; then
    source /Users/luke/google-cloud-sdk/arg_rc
fi

alias sshvm='ssh -i ~/.vagrant.d/insecure_private_key vagrant@192.168.56.50'
ssh-add ~/.vagrant.d/insecure_private_key 2> /dev/null

alias lsc='sudo python /opt/HybridCluster/src/devtools/StateMachineTester.py -c "dict([(x, (self._containerNetworkAllocator.jailConfig.get(x, {}).get(\"ID\", \"\")[:12], self._containerNetworkAllocator.jailConfig.get(x, {}).get(\"Name\"), self._containerNetworkAllocator.jailConfig.get(x, {}).get(\"NetworkSettings\", {}).get(\"IPAddress\", \"none\").encode(\"ascii\"), self.filesystem_handlers[x].state)) for x in self.myFilesystems])"'
alias lsd='sudo python /opt/HybridCluster/src/devtools/StateMachineTester.py -c "dict([(x, (y[\"ID\"][:12], y[\"Name\"], self.filesystem_handlers[x].state)) for (x, y) in self._containerNetworkAllocator.jailConfig.iteritems()])"'

alias juggler='sudo /opt/HybridCluster/src/watch-juggler.sh'
alias filesystems='sudo /opt/HybridCluster/src/watch-filesystems.sh'
alias countdown='sudo tail -f /opt/HybridCluster/log/sitejuggler.log |grep "will be declared"'
#if which docker-osx > /dev/null; then eval `docker-osx env`; fi

export GOPATH=~/gocode
export PATH=~/gocode/bin:$PATH
