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

OR

If you're feeling brave, you can try the setup.sh script which will
attempt to automatically install the necessary software packages, clone
the repo, set up the dotfiles, and install RVM all in one fell swoop.

    bash <(curl -s https://github.com/bratta/dotfiles/raw/master/setup.sh)

This is setup to work for OS X using either macports or homebrew, as
well as Ubuntu using aptitude.

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
