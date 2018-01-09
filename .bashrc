alias vim="nvim"
alias c="cd ~/Sites/jcfrancisco.com/public"
alias b="git branch | grep \* | sed 's/\*\ //'"
alias be="bundle exec"
alias gclear='git branch | grep -v ^\**\ *"master\|develop\|next-release\|rc"$ | xargs git branch -D'
alias ppjson="python3.5 -mjson.tool"
alias acb="cd ~/Projects/wesacb-api"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/carlo/pear/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="./bin:$PATH"

export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"

export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

export SD_PORT=4444

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# required so that maven uses non-Apple Java
#export JAVA_HOME=$(/usr/libexec/java_home)
#launchctl setenv JAVA_HOME $JAVA_HOME

# R29-specific run commands
if [ -f ~/.r29rc ]; then
  source ~/.r29rc
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
