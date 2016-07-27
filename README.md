## Description

This directory will have all my dot (.) files that specify program preferences.

* bashrc for bash aliases/functions
* bashrc for fish aliases/functions
* Rprofile for R options
* gitconfig, gitignore for git
* pythonrc, python startup
* Xresources, xterm options

## Setup

Place a symbolic link in the home folder for each file (edit the DOTFILES variable below)
```bash
export DOTFILES=$HOME/Documents/code/dotfiles
ln -s $DOTFILES/gitignore ~/.gitignore_global
ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/Rprofile ~/.Rprofile
ln -s $DOTFILES/bashrc ~/.bashrc
ln -s $DOTFILES/fishrc ~/.config/fish/config.fish
ln -s $DOTFILES/pythonrc.py ~/.pythonrc
ln -s $DOTFILES/Xresources ~/.Xresources
```

If `~/.bashrc` already exists, then `cp ~/.bashrc ~/.bashrc.bak` or `cat ./bashrc >> ~/.bashrc`.
