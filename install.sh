#!/bin/bash

## Deploy customised environment to current $HOME.

LN=$(/usr/bin/which ln)
XRDB=$(/usr/bin/which xrdb)

# vim
$LN -sf $HOME/.environment/vim $HOME/.vim
$LN -sf $HOME/.environment/vim/.vimrc $HOME/.vimrc

# X
$LN -sf $HOME/.environment/X/.Xresources $HOME/.Xresources
$XRDB $HOME/.Xresources
