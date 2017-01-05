
# Path to the bash it configuration
export BASH_IT="/Users/daniel/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='simple'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:/usr/local/share/npm/bin
export PATH=/usr/local/php5/bin:$HOME/bin/play/:$PATH
export PATH=$PATH:$HOME/bin/android-sdk/tools:$HOME/bin/android-skd/platform-tools:$HOME/tools/sbt/bin/

# CDPATH
export CDPATH=~/code

# Mvim
export EDITOR="emacs -nw"
export VISUAL="emacs -nw"

export PGHOST=localhost
export DB_HOST=localhost

### Added by the Heroku Toolbelt
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/bin:$PATH"

## Aliases
alias vim="/usr/local/bin/vim"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias zshconfig="emacs -nw ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="emacs -nw ~/.vimrc"
alias gitconfig="emacs -nw ~/.gitconfig"
alias tmuxconfig="emacs -nw ~/.tmux.conf"
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

eval "$(rbenv init -)"
