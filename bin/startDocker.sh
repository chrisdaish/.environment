#!/bin/bash

VM=default
DOCKER_MACHINE=/usr/local/bin/docker-machine
VBOXMANAGE=/Applications/VirtualBox.app/Contents/MacOS/VBoxManage

unset DYLD_LIBRARY_PATH
unset LD_LIBRARY_PATH

if [ ! -f $DOCKER_MACHINE ] || [ ! -f $VBOXMANAGE ]; then
  echo "Either VirtualBox or Docker Machine are not installed. Please re-run the Toolbox Installer and try again."
  exit 1
fi

$VBOXMANAGE showvminfo $VM &> /dev/null
VM_EXISTS_CODE=$?

if [ $VM_EXISTS_CODE -eq 1 ]; then
  # echo "Creating Machine $VM..."
  $DOCKER_MACHINE rm -f $VM &> /dev/null
  rm -rf ~/.docker/machine/machines/$VM
  $DOCKER_MACHINE -D create -d virtualbox --engine-env HTTP_PROXY=$HTTP_PROXY --virtualbox-memory 2048 $VM
fi

# Starting machine $VM...
$DOCKER_MACHINE start $VM

#Starting socat for Xforwarding
open -a XQuartz
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &

eval $($DOCKER_MACHINE env $VM --shell=bash)
clear
