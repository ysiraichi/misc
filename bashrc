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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

bold='\[\e[1m\]'
reset='\[\e[0m\]'
gitC='\[\e[38;5;208m\]'
pathC='\[\e[38;5;33m\]'
userC='\[\e[38;5;40m\]'
signC='\[\e[38;5;1m\]'

signal='⪧'

prompt() {
    gitI=`git rev-parse --abbrev-ref HEAD 2> /dev/null`

    if [ "$gitI" != "" ]; then
        gitI="($gitI) "
    fi

    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
    PS1+="${bold}${userC}\u@\h ${gitC}${gitI}${pathC}\w${reset}\n"
    PS1+="${bold}${signC}${signal} ${reset}"
}

PROMPT_COMMAND=prompt

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

# Sourcing completions
srcStart=`date +%s%N`
compFolder="/usr/share/bash-completion/completions"
scripts=( "git" "apt-get" "apt-cache" "find" "groupadd" "groupdel" \
    "modprobe" "mount" "gsettings" "ip" "java" "kill" "useradd" "userdel" "update-alternatives" )

for script in ${scripts[@]}; do
    [ -f $compFolder/$script ]; . $compFolder/$script
done
srcTime=`echo "scale=4; ($(date +%s%N) - $srcStart)/1000000" | bc`
echo "Loading sources: $srcTime"

# IBus utils
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# PATH updates
pathStart=`date +%s%N`
localBin="/home/yukio/Programs/.bin_path"
progPath=`cat $localBin | paste -s -d':'`
export PATH=$PATH:$progPath

gemPath="/home/yukio/.gem/ruby/2.1.0/bin"
export PATH=$PATH:$gemPath
pathTime=`echo "scale=4; ($(date +%s%N) - $pathStart)/1000000" | bc`
echo "Loading path: $pathTime"

# Sourcing ike
IKE_PATH=/home/yukio/DotFiles
ike_exe="${IKE_PATH}/ike"
ike_compl="${IKE_PATH}/ike_completion"
[ -f ${ike_exe} ]; . ${ike_exe}
[ -f ${ike_compl} ]; . ${ike_compl}

dbus-update-activation-environment --all
# screenfetch

clear
