#!/bin/bash

## Deploy customised environment to current $HOME.

LN=$(/usr/bin/which ln)
XRDB=$(/usr/bin/which xrdb)

# bash
$LN -sf $HOME/.environment/.aliases $HOME/.aliases
$LN -sf $HOME/.environment/.bashrc $HOME/.bashrc
$LN -sf $HOME/.environment/.bash_profile $HOME/.bash_profile
$LN -sf $HOME/.environment/.corp $HOME/.corp
$LN -sf $HOME/.environment/.dockerfunctions $HOME/.dockerfunctions
$LN -sf $HOME/.environment/.exports $HOME/.exports
$LN -sf $HOME/.environment/.proxy $HOME/.proxy

# bin
if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi
$LN -sf $HOME/.environment/bin/termProxy.sh $HOME/bin/termProxy.sh

# git
$LN -sf $HOME/.environment/.gitconfig $HOME/.gitconfig

# i3
if [[ ! -L "$HOME/.i3" ]]; then
  $LN -sf $HOME/.environment/i3 $HOME/.i3
fi
$LN -sf $HOME/.environment/i3/i3status.conf $HOME/.i3status.conf

# vim
if [[ ! -L "$HOME/.vim" ]]; then
  $LN -sf $HOME/.environment/vim $HOME/.vim
fi
$LN -sf $HOME/.environment/vim/.vimrc $HOME/.vimrc

# X
$LN -sf $HOME/.environment/X/.Xresources $HOME/.Xresources
$LN -sf $HOME/.environment/X/.Xprofile $HOME/.Xprofile
$XRDB $HOME/.Xresources

# fonts
if [[ ! -L "$HOME/.fonts" ]]; then
  $LN -sf $HOME/.environment/fonts $HOME/.fonts
fi

# Docker environment configuration
if [[ ! -L "$HOME/.docker-environment" ]]; then
  $LN -sf $HOME/.environment/docker-environment $HOME/.docker-environment
fi

setup_sudo(){
  # keep some enviornment variables
  echo -e 'Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy "' >> /etc/sudoers

  # don't require a password
  echo -e "chris.daish ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
}
