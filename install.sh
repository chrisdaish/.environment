#!/bin/bash

## Deploy customised environment to current $HOME.

LN=$(/usr/bin/which ln)
XRDB=$(/usr/bin/which xrdb)

# bash
$LN -sf $HOME/.environment/.bash_profile $HOME/.bashrc
$LN -sf $HOME/.environment/.bash_profile $HOME/.bash_profile
$LN -sf $HOME/.environment/.corp $HOME/.corp
$LN -sf $HOME/.environment/.aliases $HOME/.aliases
$LN -sf $HOME/.environment/.dockerfunctions $HOME/.dockerfunctions

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

