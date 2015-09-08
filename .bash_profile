#! /bin/bash

if [[ `uname` = 'Darwin' ]]; then
  export PATH="/usr/local/bin:$PATH"
  source "`brew --prefix grc`/etc/grc.bashrc"
fi

for file in ~/.{bash_prompt,aliases,functions,path,extra,exports,proxy,dockerfunctions}; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file
