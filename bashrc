# ---------------------------------------------------------------------
# Already here

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# ---------------------------------------------------------------------
# Basics

# Par init
export PARINIT=rTbgqR\ B\=.\,\?_A_a\ Q\=_s\>\|

# Some color in your life
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

#----------------------------------------------------------------------
# My stuff

# Aliases
alias ack='ack --color-match=bright_red --color-line=green'
alias ag='ag --color-match="1;3;35" --color-line-number="32" --color-path="3;32;1" --column -S'
alias agc='ag --color-match="1;3;35" --color-line-number="32" --color-path="3;32;1" --column --stats -S -C 2'
alias agrep='ag --color-match="1;3;31" --color-line-number="32" --color-path="35" --noheading --column -S'
alias rcp='rsync --progress --size-only --inplace --verbose'
alias vlch='vlc --extraint http'
# alias todom='vim -g $todo'
# alias todod='vim -g $doyle/progress/todo.md'

# Shortcut to startup pythonrc
# export PYTHONSTARTUP=~/.pythonrc

# Set PATH
# PATH=$PATH:/home/mauricio/Downloads/large/MATLAB/R2014b/bin/:/usr/local/stata/:$PROJECTS/code/bin/

# Functions
# ---------

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

# Cat aliases. Named for fun but some are useful
# ----------------------------------------------

alias catssd='sudo smartctl -a /dev/sdb1 | less'
alias cathdd='sudo smartctl -a /dev/sda1 | less'
alias catspace='du -Sm | sort -rn | less'
alias catping='ping www.google.com'
alias catwants='pacaur -S --needed --noconfirm'
alias cathates='pacaur -R --noconfirm'
alias catupgrade='pacaur -Syu --needed'
alias catsearch='pacaur -Ss'
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

# ---------------------------------------------------------------------
# Paths

# added by Anaconda2 2.4.1 installer
# export PATH="/home/mauricio/anaconda2/bin:$PATH"
# export PATH=/home/mauricio/anaconda3/bin:$PATH
# export PATH=/home/mauricio/Downloads/chris/infrep:$PATH

# Path to projects
# export doyle=/home/mauricio/Documents/projects/ra/doyle
# export todo=/home/mauricio/Downloads/zznow/todo.md
export install=/home/mauricio/Documents/all/99-install/install-arch.md
export projects=/home/mauricio/Documents/projects
export dotvim=/home/mauricio/Documents/code/dotvim
export mbin=/home/mauricio/Documents/code/bin
export mlib=/home/mauricio/Documents/code/lib

export gems=/home/mauricio/.gem/ruby/2.3.0/bin
if [ -d "$gems" ]; then
    export PATH=$gem:$PATH
fi

if [ -d "$mbin" ]; then
    export PATH=$mbin:$PATH
fi

if [ -d "/usr/local/stata" ]; then
    export PATH=/usr/local/stata:$PATH
fi

# ---------------------------------------------------------------------
# History

# Avoid duplicates
export HISTCONTROL=ignoredups
export HISTFILESIZE=8192

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
