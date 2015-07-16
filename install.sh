#!/bin/bash

## Deploy customised environment to current $HOME.

LN=$(/usr/bin/which ln)
XRDB=$(/usr/bin/which xrdb)

# bash
$LN -sf $HOME/.environment/.bash_profile $HOME/.bash_profile
$LN -sf $HOME/.environment/.corp $HOME/.corp
$LN -sf $HOME/.environment/.dockerfunctions $HOME/.dockerfunctions

# vim
$LN -sf $HOME/.environment/vim $HOME/.vim
$LN -sf $HOME/.environment/vim/.vimrc $HOME/.vimrc

# X
$LN -sf $HOME/.environment/X/.Xresources $HOME/.Xresources
$XRDB $HOME/.Xresources

# i3
$LN -sf $HOME/.environment/i3 $HOME/.i3
$LN -sf $HOME/.environment/i3/i3status.conf $HOME/.i3status.conf
