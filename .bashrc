alias carlo="ssh -p 30000 carlo@198.199.78.108"
alias c="cd ~/Sites/jcfrancisco.com/public"
alias b="git branch | grep \* | sed 's/\*\ //'"
alias be="bundle exec"
alias vim="mvim -v"
alias gclear='git branch | grep -v ^\**\ *"master\|develop\|next-release\|rc"$ | xargs git branch -D'
alias ppjson="python3.5 -mjson.tool"
alias s="cd ~/Projects/snaps"
alias acb="cd ~/Projects/wesacb-api"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/carlo/pear/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"

export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

export SD_PORT=4444

# make coffee -w work again
ulimit -n 8192

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# required so that maven uses non-Apple Java
export JAVA_HOME=$(/usr/libexec/java_home)
launchctl setenv JAVA_HOME $JAVA_HOME

# Groupon-specific run commands
if [ -f ~/.grouponrc ]; then
  source ~/.grouponrc
fi

# Some private bitcoin stuff
if [ -f ~/.btcrc ]; then
  source ~/.btcrc
fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
