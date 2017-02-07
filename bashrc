# ---------------------------------------------------------------------
# Already here

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'

# Fuzzy file finder, github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Par (nicemice.net/par) p=init
export PARINIT=rTbgqR\ B\=.\,\?_A_a\ Q\=_s\>\|

# ---------------------------------------------------------------------
# History

# Avoid duplicates
export HISTCONTROL=ignoredups
export HISTFILESIZE=8192

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export NVM_DIR="/home/mauricio/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# ---------------------------------------------------------------------
# Aliases

# Basic aliases
# -------------

# Some color in your life
alias ls    = 'ls --color=auto'
alias dir   = 'dir --color=auto'
alias vdir  = 'vdir --color=auto'
alias alert = 'notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# grep
alias grep  = 'grep --color=auto'
alias fgrep = 'fgrep --color=auto'
alias egrep = 'egrep --color=auto'

# ag, ack
alias ack   = 'ack --color-match=bright_red --color-line=green'
alias ag    = 'ag --color-match="1;3;35" --color-line-number="32" --color-path="3;32;1" --column -S'
alias agc   = 'ag --color-match="1;3;35" --color-line-number="32" --color-path="3;32;1" --column --stats -S -C 2'
alias agrep = 'ag --color-match="1;3;31" --color-line-number="32" --color-path="35" --noheading --column -S'

# some more ls aliases
alias ll = 'ls -alFh'
alias la = 'ls -A'
alias l  = 'ls -CF'

# misc
alias rcp  = 'rsync --progress --size-only --inplace --verbose'
alias vlch = 'vlc --extraint http'

# Cat aliases. Mainly for fun but some are useful
# -----------------------------------------------

alias catssd       = 'sudo smartctl -a /dev/sdb1 | less'
alias cathdd       = 'sudo smartctl -a /dev/sda1 | less'
alias catspace     = 'du -Sm | sort -rn | less'
alias catping      = 'ping www.google.com'
alias catwants     = 'pacaur -S --needed --noconfirm'
alias cathates     = 'pacaur -R --noconfirm'
alias catupgrade   = 'pacaur -Syu --needed'
alias catsearch    = 'pacaur -Ss'
alias catedit      = 'vim'
alias catunpack    = 'unp'
alias catsync      = 'rsync -arhlvv --progress --update'
alias catstarwars  = 'telnet towel.blinkenlights.nl'
alias catup        = 'xdotool key XF86MonBrightnessUp'
alias catdown      = 'xdotool key XF86MonBrightnessDown'
alias catbattery   = 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias catsweave    = 'R CMD Sweave --pdf'
alias catcopy      = 'xsel --clipboard --input'
alias catpaste     = 'xsel --clipboard --output'
alias catshred     = 'shred -zuv'
alias catborg      = 'borg create --stats --progress --verbose --compression lz4'

# ---------------------------------------------------------------------
# Paths

# added by Anaconda2 2.4.1 installer
# export PATH=/home/mauricio/anaconda2/bin:$PATH
# export PATH=/home/mauricio/anaconda3/bin:$PATH
# export PATH=/home/mauricio/Downloads/chris/infrep:$PATH

# Path to projects
export install  = $HOME/Documents/code/lib/install-arch.md
export mbin     = $HOME/Documents/code/bin
export gems     = $HOME/.gem/ruby/2.3.0/bin
export rootgems = /root/.gem/ruby/2.3.0/bin

# npm config set prefix '~/.npm-global'
# export PATH=~/.npm-global/bin:$PATH

# Home bin
# --------

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# if [ -d "$gems" ]; then
#     export PATH=$gems:$PATH
# fi

# if [ -d "$rootgems" ]; then
#     export PATH=$rootgems:$PATH
# fi

# if [ -d "$mbin" ]; then
#     export PATH=$mbin:$PATH
# fi

# For whatever reason, having Stata in my path messes up my install
# if [ -d "/usr/local/stata" ]; then
#     export PATH=/usr/local/stata:$PATH
# fi

# if [ -d "$HOME/.local/stata13" ]; then
#     export PATH=$PATH:$HOME/.local/stata13
# fi

#----------------------------------------------------------------------
# My stuff

# Shortcut to startup pythonrc
# export PYTHONSTARTUP=$HOME/.pythonrc

# Set PATH
# PATH=$PATH:$HOME/.local/MATLAB/R2016b/bin/:$HOME/.local/stata13/:$HOME/.local/bin/

# Functions
# ---------

# shorthand for apparent size in du
function mdu() {
    du -h $1 --apparent-size --max-depth=0
}

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

# Speech!
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
