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
export EDITOR=vim
export VISUAL=/usr/local/bin/vim

export PGHOST=localhost
export DB_HOST=localhost

### Added by the Heroku Toolbelt
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/bin:$PATH"

## Aliases
alias vim="/usr/local/bin/vim"
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias gitconfig="vim ~/.gitconfig"
alias tmuxconfig="vim ~/.tmux.conf"
alias tmuxreload="tmux source-file ~/.tmux.conf"

# Linux aliases
alias install="sudo apt-get install -y"
alias upgrade="sudo apt-get upgrade && sudo apt-get update"

# Ruby
alias be="bundle exec"
alias rs="be rails s"
alias rd="be rake release_dev"
alias rc="be rake release_compatible"
alias rb="be rake release_bugfix"
alias rt="be rspec"
alias bi="bundle install --path=./vendor"
alias bu="bundle upgrade"
alias rspec="be rspec"

# Javascript
alias jt="npm test"

# Git
alias gc="git clone"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
