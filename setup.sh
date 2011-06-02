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
    manager="sudo apt-get install"
    packages="build-essential ruby ri rdoc ruby1.8-dev irb1.8 libreadline-ruby1.8 libruby1.8 rdoc1.8 ri1.8 ruby1.8 irb libreadline5 psmisc wget git-core tree"
  else
    echo "I have no idea what you are running."
    echo "I need OS X or an Ubuntu/debian system running aptitude."
    exit 1
  fi
fi

# Install necessary packages
$manager $packages

# Symlink dotfiles
rake

# Make sure RVM is in place
[[ -s "$HOME/.rvm/scripts/rvm" ]] || bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
