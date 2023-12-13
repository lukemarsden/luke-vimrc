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

# set a fancy prompt - always
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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
alias z='zfs list -t snapshot,filesystem -r hpool/hcfs'
alias io='sudo /usr/sbin/iostat -I -x -w 1 |grep -v pass'
alias ack='ack-grep'

export CLICOLOR=1
export PATH=$HOME/bin:$HOME/.cask/bin:/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/games:/usr/local/sbin:$PATH
export LS_COLORS="`echo $LS_COLORS |sed 's/di=[0-9]*;[0-9]*/di=01;34/; s/ow=[0-9]*;[0-9]*/ow=01;34/'`"

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export FTP_PASSIVE_MODE=1
#if [ "$PS1" ] ; then
#mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#echo $$ > /dev/cgroup/cpu/user/$$/tasks
#echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
shopt -s histappend
export PROMPT_COMMAND="history -a"

alias sagi='sudo apt-get install -y'
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

if which boot2docker > /dev/null 2>/dev/null; then
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=/Users/luke/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
fi

alias edm='eval "$(docker-machine env default)"'

export GOPATH=~/gocode

export PATH=/usr/local/go/bin:/usr/lib/go-1.10/bin/:$HOME/gocode/bin:$PATH

export VAGRANT_DEFAULT_PROVIDER=virtualbox

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash
# added by Miniconda3 installer
export PATH="/Users/luke/miniconda3/bin:/home/luke/.local/bin/:$PATH"
export GATEWAY_HOSTNAME=192.168.188.1
#echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
export TERM=xterm
if [ -f ~/.tokens ]; then
    source ~/.tokens
fi
export BASH_SILENCE_DEPRECATION_WARNING=1
stty werase ^p
export GOPRIVATE="gitlab.mlops.consulting"
if [ -f ~/pp/pachyderm/etc/contributing/bash_helpers ]; then
    source ~/pp/pachyderm/etc/contributing/bash_helpers
fi
#export PATH="/home/luke/.pyenv/bin:$PATH"
export QT_QPA_PLATFORMTHEME=qt5ct
#if which pyenv >/dev/null; then
#    eval "$(pyenv init -)"
#    eval "$(pyenv virtualenv-init -)"
#fi
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH="$HOME/.poetry/bin:$PATH"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
. "$HOME/.cargo/env"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
# Wasmer
export WASMER_DIR="/home/luke/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
export GOBIN=$HOME/gocode/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
if [ -d "$HOME/.cargo" ]; then
    source "$HOME/.cargo/env"
fi
alias sessions="echo; tmux list-sessions |cut -d ':' -f 1 |sort; echo"
