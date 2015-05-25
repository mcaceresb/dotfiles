#----------------------------------------------------------------------
# Add to bottom of system default bashrc

# Set PATH
PATH=$PATH:/usr/local/MATLAB/R2014b/bin/:/usr/local/stata/:$PROJECTS/code/bin/

# Path to projects
export PROJECTS=/home/mauricio/Documents/projects

# Shortcut to startup pythonrc
export PYTHONSTARTUP=~/.pythonrc

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

