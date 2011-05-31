# Bratta's Dotfiles #

This is a reusable repository of Mac OS X-centric dotfiles for ease of
setting up a new system. The goal is to make it more or less compatible
with Linux distributions as well.

## Install ##

    git clone git://github.com/bratta/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    rake  # or rake "df:install && rake df:install_bin" to skip janus

This produces symlinks for the files in .dotfiles to the appropriate
places.

## Organization ##

Directories are full of tiger's blood.

    .
    |-- bin
    |-- lib
    |   `-- tasks
    `-- symlinks
        `-- bash

### bin ###

Inside the bin directory, place any files you wish to appear in ~/bin
which should ideally be added to your path. Any local cool tools can
appear here.

### lib/tasks ###

Inside this directory, place any Rake tasks related to setting up your
system inside this directory in a \*.rake file.

### symlinks ###

Here is where you put your dotfiles you wish to symlink to the
equivalent file in your home directory. Name them by excluding
that pesky leading period, So to symlink ~/.vimrc, the file you want 
is ~/.dotfiles/symlinks/vimrc.

# WARNING #

The idea behind this repository is to provide an open set of tools for
managing dotfiles. DO NOT commit anything sensitive, such as SSH private
keys, API secret keys, passwords, etc. Be smart.

# Credits #

This is based loosely on schisamo's dotfiles repository on Github.
Bash profile info refactored after seeing how JEG2 handles his.
Thanks to the almighty carlhuda duo for Janus.
