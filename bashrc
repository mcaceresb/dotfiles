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

# some more ls aliases
alias ll='ls -alFh'
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
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

#----------------------------------------------------------------------
# Add to bottom of system default bashrc

# Path to projects
export PROJECTS=/home/mauricio/Documents/projects

# Shortcut to startup pythonrc
export PYTHONSTARTUP=~/.pythonrc

# Set PATH
PATH=$PATH:/usr/local/MATLAB/R2014b/bin/:/usr/local/stata/:$PROJECTS/code/bin/

# Shortcut to play music from terminal
function mcplay() {
    mplayer -msgcolor -gapless-audio -shuffle -playlist "$HOME/Music/Playlists/$1"
}

# Save output AND input to file
function catRsave() {
    R --no-save --quiet < $1 > $2.txt
}

# Word count of latex file
function catlatexwc() {
    detex $1 | wc -w
}

# SSL aliases to encrypt/decrypt files
function catcompress() {
    tar cz $1 | openssl enc -aes-256-cbc -e -salt > $1.tar.gz.enc
}
function catencrypt() {
    openssl aes-256-cbc -e -in $1 -out $1.enc
}
function catdecrypt() {
    openssl aes-256-cbc -d -in $1.enc -out $1
}

#Speech!
function catspeak() {
    pico2wave -l=en-GB -w=/tmp/__temppico__.wav "$1"
    aplay /tmp/__temppico__.wav
    rm /tmp/__temppico__.wav
}
function say() {
    pico2wave -l=en-GB -w=/tmp/__temppico__.wav "$1"
    aplay /tmp/__temppico__.wav
    rm /tmp/__temppico__.wav
}

# Start vlc as server
alias vlch='vlc --extraint http'

# Cat aliases. Named for fun but some are useful
alias catssd='sudo smartctl -a /dev/sdb1 | less'
alias cathdd='sudo smartctl -a /dev/sda1 | less'
alias catspace='du -Sm | sort -rn | less'
alias catping='ping www.google.com'
alias catwants='sudo apt-get -y install'
alias cathates='sudo apt-get -y remove'
alias catsearch='aptitude search'
alias catedit='vimw'
alias catunpack='unp'
alias catsync='rsync -arhlvv --progress'
alias catmatlab='/usr/local/MATLAB/R2014b/bin/matlab'
alias catstar-wars='telnet towel.blinkenlights.nl'

alias catup='xdotool key XF86MonBrightnessUp'
alias catdown='xdotool key XF86MonBrightnessDown'
alias catleapcast='cd $HOME/.virtualenvs && leapcast'
alias catbattery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias catsweave='R CMD Sweave --pdf'
alias catfuze='/usr/bin/fuze'
alias catcopy='xsel --clipboard --input'
alias catpaste='xsel --clipboard --output'
alias catshred='shred -zuv'
alias catrsync='rsync -arhlvv --progress --update'
alias catgitpush='git push -u origin --all && git push -u origin --tags'

