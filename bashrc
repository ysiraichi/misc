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
signal='⪧'

get_foreground_color() {
    echo "\[\e[38;5;${1}m\]"
}

get_background_color() {
    echo "\[\e[48;5;${1}m\]"
}

colors=( 208 33 40 1 246 234 196 )
gitC=`get_foreground_color ${colors[0]}`
pathC=`get_foreground_color ${colors[1]}`
userC=`get_foreground_color ${colors[2]}`
signC=`get_foreground_color ${colors[3]}`
bracC=`get_foreground_color ${colors[4]}`
backC=`get_background_color ${colors[5]}`
retC=`get_foreground_color ${colors[6]}`


prompt() {
    ret=`echo $?`
    if [ $ret -eq 0 ]; then
        ret=""
    else
        ret="(${ret})\n"
    fi

    gitI=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    if [ "$gitI" != "" ]; then
        gitI="($gitI) "
    fi

    PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \a\]"

    # Show the return value if failed.
    PS1+="${retC}${ret}"

    # [
    PS1+="${backC}"
    PS1+="${bold}${bracC}[${reset}"

    # user@host (branch) path
    PS1+="${backC}"
    PS1+="${userC}\u@\h ${gitC}${gitI}${pathC}\W"

    # ]
    PS1+="${bold}${bracC}]${reset}"
    # prompt
    PS1+="${signC}${signal}${reset}"
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
programsBinPath="/home/yukio/_Programs/bin_paths"
programsPath=`cat $programsBinPath | paste -sd ':'`
export PATH=$PATH:$programsPath
pathTime=`echo "scale=4; ($(date +%s%N) - $pathStart)/1000000" | bc`
echo "Loading path: $pathTime"

# Sourcing ike
IKE_PATH=/home/yukio/_DotFiles
ike_exe="${IKE_PATH}/ike"
ike_compl="${IKE_PATH}/ike_completion"
[ -f ${ike_exe} ]; . ${ike_exe}
[ -f ${ike_compl} ]; . ${ike_compl}

# Bash VI-mode bindings
set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind '"\C-l":clear-screen'

# dbus-update-activation-environment --all
# screenfetch

export LOCAL_LIBS="$HOME/_Libs"

# clear
