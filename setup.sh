#!/bin/bash

#
# WARNING: This script is still experimental,
# untested, possibly buggy, and still a work in progress.
# Use this at your own risk. I will not be responsible
# if this calls your mom a dirty name and steals your
# lunch money.
#

arch=`uname -a | awk '{ print $1 }'`
if [ "$arch" == "Darwin" ]; then
  echo "It appears you are running OS X"
  if [ `which port` ]; then
    manager="sudo port install"
    packages="wget git-core mtr gnu-coreutils tree"
  elif [ `which brew` ]; then
    manager="brew install"
    packages="wget git mtr coreutils tree"
  else
    echo "You do not appear to have macports or homebrew installed."
    echo "Fix this if you want me to take you seriously, yo."
    exit 1
  fi
else
  if [ `which apt-get` ]; then
    echo "It appears you are running Ubuntu"
    manager="sudo apt-get -y install"
    packages="build-essential ruby-full rubygems rake wget git-core tree"
  else
    echo "I have no idea what you are running."
    echo "I need OS X or an Ubuntu/debian system running aptitude."
    exit 1
  fi
fi

# Install necessary packages
$manager $packages

# Now we should have git. Let's get the dotfiles repo and go to town
if [[ -d ~/.dotfiles ]]; then
  cd ~/.dotfiles
  git pull
else
  git clone https://bratta@github.com/bratta/dotfiles.git ~/.dotfiles
fi
cd ~/.dotfiles

# Symlink dotfiles
/bin/bash -ci "cd ~/.dotfiles; rake"

# Make sure RVM is in place
[[ -s "$HOME/.rvm/scripts/rvm" ]] || bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
