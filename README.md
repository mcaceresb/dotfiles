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
ln -s ./bashrc ~/.bashrc
ln -s ./Rprofile ~/.Rprofile
ln -s ./gitconfig ~/.gitconfig
ln -s ./gitignore ~/.gitignore_global
```

For `bashrc`, run
```bash
cp ~/.bashrc ~/.bashrc.bak
echo '' >> ~/.bashrc
cat ./bashrc >> ~/.bashrc
```

## Todo

Figure out whether to put dotvim here

