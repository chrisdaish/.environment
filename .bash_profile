#! /bin/bash

if [[ `uname` = 'Darwin' ]]; then
  # brew stuffs
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  source '/usr/local/etc/grc.bashrc'
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

for file in ~/.{aliases,functions,path,extra,exports,proxy,corp,dockerfunctions}; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# OSX bash completion
if [[ `uname` = 'Darwin' ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Set keyboard repeat rate
if [[ `uname` = 'Darwin' ]]; then
  # Set the OSX keyboard speed here
  echo ''
else
  xset r rate 200 20
fi

if [[ -f $HOME/.bash_prompt ]]; then
  # Solarized dark colour theme.
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    PROMPT_USER_COLOR="$(tput bold)$(tput setaf 37)" # BOLD CYAN
    PROMPT_PREPOSITION_COLOR="$(tput bold)$(tput setaf 244)" # BOLD BASE0
    PROMPT_DEVICE_COLOR="$(tput bold)$(tput setaf 37)" # BOLD CYAN
    PROMPT_DIR_COLOR="$(tput bold)$(tput setaf 33)" # BOLD BLUE
    PROMPT_GIT_STATUS_COLOR="$(tput bold)$(tput setaf 136)" # BOLD YELLOW
    PROMPT_GIT_PROGRESS_COLOR="$(tput bold)$(tput setaf 136)" # BOLD YELLOW
    PROMPT_SYMBOL_COLOR="$(tput bold)$(tput setaf 136)" # BOLD YELLOW
  else
    PROMPT_USER_COLOR="$(tput bold)$(tput setaf 6)" # BOLD CYAN
    PROMPT_PREPOSITION_COLOR="$(tput bold)$(tput setaf 12)" # BOLD BASE0
    PROMPT_DEVICE_COLOR="$(tput bold)$(tput setaf 6)" # BOLD CYAN
    PROMPT_DIR_COLOR="$(tput bold)$(tput setaf 4)" # BOLD BLUE
    PROMPT_GIT_STATUS_COLOR="$(tput bold)$(tput setaf 3)" # BOLD YELLOW
    PROMPT_GIT_PROGRESS_COLOR="$(tput bold)$(tput setaf 3)" # BOLD YELLOW
    PROMPT_SYMBOL_COLOR="$(tput bold)$(tput setaf 3)" # BOLD YELLOW
  fi
  source $HOME/.bash_prompt
fi

# RBEnv for localised Ruby environments
eval "$(rbenv init -)"
