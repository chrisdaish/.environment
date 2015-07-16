#! /bin/bash

for file in ~/.{bash_prompt,aliases,functions,path,extra,exports,corp,dockerfunctions}; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file
