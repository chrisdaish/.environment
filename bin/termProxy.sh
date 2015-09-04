#!/bin/bash
#
# Auto-map the proxy to the terminal.
#
if [[ `uname` = 'Darwin' ]]; then
  SERVICE_GUID=`printf "open\nget State:/Network/Global/IPv4\nd.show" | scutil | grep "PrimaryService" | awk '{print $3}'`
  SERVICE_NAME=`printf "open\nget Setup:/Network/Service/$SERVICE_GUID\nd.show" | scutil | grep "UserDefinedName" | awk -F': ' '{print $2}'`

  HTTP_PROXY_HOSTNAME=`networksetup -getwebproxy "$SERVICE_NAME" | awk {'print $2'} | awk 'FNR == 2 {print}' | cut -d' ' -f2`
  HTTP_PROXY_PORT=`networksetup -getwebproxy "$SERVICE_NAME" | awk {'print $2'} | awk 'FNR == 3 {print}' | cut -d' ' -f2`
  if [[ $HTTP_PROXY_HOSTNAME != '' ]]; then
    export http_proxy="${HTTP_PROXY_HOSTNAME}:${HTTP_PROXY_PORT}";
    export HTTP_PROXY=$http_proxy
  else
    unset http_proxy
    unset HTTP_PROXY
  fi

  HTTPS_PROXY_HOSTNAME=`networksetup -getsecurewebproxy "$SERVICE_NAME" | awk {'print $2'} | awk 'FNR == 2 {print}' |  cut -d' ' -f2`
  HTTPS_PROXY_PORT=`networksetup -getsecurewebproxy "$SERVICE_NAME" | awk {'print $2'} | awk 'FNR == 3 {print}' | cut -d' ' -f2`
  if [[ $HTTPS_PROXY_HOSTNAME != '' ]]; then
    export https_proxy="${HTTPS_PROXY_HOSTNAME}:${HTTPS_PROXY_PORT}";
    export HTTPS_PROXY=$https_proxy
  else
    unset https_proxy
    unset HTTPS_PROXY
  fi
fi
