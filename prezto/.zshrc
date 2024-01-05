# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:/usr/local/share/npm/bin
export PATH=/usr/local/php5/bin:$HOME/bin/play/:$PATH
export PATH=$PATH:$HOME/bin/android-sdk/tools:$HOME/bin/android-skd/platform-tools:$HOME/tools/sbt/bin/

# CDPATH
export CDPATH=~/code

# Mvim
export EDITOR=nvim
export VISUAL=$EDITOR

export PGHOST=localhost

### Added by the Heroku Toolbelt
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/bin:$PATH"

## Aliases
alias vim=nvim
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="vim ~/.config/nvim/init.lua"
alias gitconfig="vim ~/.gitconfig"
alias tmuxconfig="vim ~/.tmux.conf"
alias tmuxreload="tmux source-file ~/.tmux.conf"
alias go_code="cd /Volumes/Code/code"

# Linux aliases
alias install="sudo apt-get install -y"
alias upgrade="sudo apt-get upgrade && sudo apt-get update"

# Javascript
alias jt="npm test"

# Git
alias gc="git clone"

eval "$(/usr/local/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export BUILD_TOKEN=<TOKEN>
export GITHUB_TOKEN=<TOKEN>
