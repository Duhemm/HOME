#!/bin/sh

source "$HOME/.mini-env"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install basic packages
brew install \
    bloop \
    cloc \
    coreutils \
    coursier \
    ctags \
    gnupg \
    gnupg2 \
    gpg-agent \
    haskell-stack \
    llvm \
    nailgun \
    node \
    sbt \
    tmux \
    vim

# Set up zsh
clone-github zsh-users zsh-completions
clone-github zsh-users zsh-syntax-highlighting
clone-github Duhemm zsh-git-prompt
pushd "$PROJECTS/Duhemm/zsh-git-prompt"
git fetch origin custom
git checkout -b custom FETCH_HEAD
stack setup
stack build && stack install

# Set up Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"
