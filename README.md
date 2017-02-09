## Description

This directory will have all my dot (.) files for various program configurations.

* bashrc: bash aliases/functions
* bashrc-sever: I often work over SSH on RedHat servers; this has some server-specific settings
* Rprofile: R options when running from console
* gitattributes: Attribute options for git
* gitconfig: Config options for git
* gitignore: Ignore options for git
* pythonrc.py: python startup (testing)
* Xresources, xterm options (mainly used over SSH, since I often don't have a pretty terminal on remote servers)

## Setup

Though I totally <3 Linux, I have found the git GUI options aesthetically unpleasing. Since my git workflow is pretty simple, I favor the visually compelling. To that end, I use [git-webui](github.com/alberthier/git-webui)
```bash
curl https://raw.githubusercontent.com/alberthier/git-webui/master/install/installer.sh | bash
```

Place a symbolic link in the home folder for each file (edit the DOTFILES variable below)
```bash
mkdir $HOME/lib
cd $HOME/lib
git clone github.com/mcaceresb/dotfiles
ln -s $HOME/lib/gitignore   $HOME/.gitignore_global
ln -s $HOME/lib/gitconfig   $HOME/.gitconfig
ln -s $HOME/lib/Rprofile    $HOME/.Rprofile
ln -s $HOME/lib/bashrc      $HOME/.bashrc
ln -s $HOME/lib/pythonrc.py $HOME/.pythonrc
ln -s $HOME/lib/Xresources  $HOME/.Xresources
```

If `~/.bashrc` already exists, then `cp ~/.bashrc ~/.bashrc.bak` or `cat ./bashrc >> ~/.bashrc`.
