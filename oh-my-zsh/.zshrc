# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="simple"
ZSH_THEME="skaro"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git git ruby rbenv brew node npm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:/usr/local/share/npm/bin
export PATH=/usr/local/php5/bin:$HOME/bin/play/:$PATH
export PATH=$PATH:$HOME/bin/android-sdk/tools:$HOME/bin/android-skd/platform-tools:$HOME/tools/sbt/bin/

# Mvim
export EDITOR=vim

export PGHOST=localhost
export DB_HOST=localhost

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/bin:$PATH"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/firefox:$PATH"
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"


## Aliases

# Example aliases
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

# Javascript
alias jt="npm test"

# Git
alias gc="git clone"

export NVM_DIR="/home/dpaulino/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
