## Description

This directory will have all my dot (.) files that specify program preferences. 

* bashrc for bash aliases/functions
* Rprofile for R options
* gitconfig, gitignore for git

## Setup 

Clone this repository using

```bash
git clone git@bitbucket.org:mcaceresb/dotfiles.git
```


Then place a symbolic link in the home folder for each file

```bash
ln -s $PROJECTS/code/201505_dotfiles/Rprofile ~/.Rprofile
ln -s $PROJECTS/code/201505_dotfiles/gitconfig ~/.gitconfig
ln -s $PROJECTS/code/201505_dotfiles/gitignore ~/.gitignore_global
ln -s $PROJECTS/code/201505_dotfiles/pythonrc.py ~/.pythonrc
```

For `bashrc`, you might run
```bash
cp ~/.bashrc ~/.bashrc.bak
echo '' >> ~/.bashrc
cat ./bashrc >> ~/.bashrc
```

Or, better, you should run `cp ~/.bashrc ~/.bashrc.bak` and then replace everything line 100 and prior to whatever the system's bashrc says (don't forget to do `alias ll='ls -alFh'` instead of `alias ll='alF'`) and then do

```bash
mv ~/.bashrc ~/.bashrc.bak
ln -s $PROJECTS/code/201505_dotfiles/bashrc ~/.bashrc
```

## Todo

* Figure out whether to keep `pythonrc.py`

