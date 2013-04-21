alias carlo="ssh -p 30000 *****@xxx.xxx.xxx.xxx" #My web hosting
alias c="cd ~/Sites/jcfrancisco.com/public"
alias b="git branch | grep \* | sed 's/\*\ //'"
alias vim="mvim -v"
alias be="bundle exec"
alias gclear="git branch | grep -v ^\**\ *master$ | xargs git branch -D"
alias mine="cgminer -o api.bitcoin.cz:8332 -u jcfrancisco.worker1 -p ****"
alias minee="cgminer -o api.bitcoin.cz:8332 -u jcfrancisco.worker1 -p **** -I 9"

export PATH="/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/carlo/pear/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

#export RUBY_HEAP_SLOTS_INCREMENT=250000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_HEAP_MIN_SLOTS=600000
#export RUBY_GC_MALLOC_LIMIT=59000000
#export RUBY_HEAP_FREE_MIN=100000

export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"

export SD_PORT=4444

# make coffee -w work again
ulimit -n 8192

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Groupon-specific run commands
if [ -f ~/.grouponrc ]; then
  source ~/.grouponrc
fi
