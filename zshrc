# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="philips"
COMPLETION_WAITING_DOTS="true"
plugins=(git osx ruby gem brew rails tmux)
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Other stuff
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:/usr/local/git/bin

#RUBY
export PATH=$PATH:/Users/simongeorges/.rvm/gems/ruby-1.9.3-p327/bin:/Users/simongeorges/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/simongeorges/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/simongeorges/.rvm/bin

#BIN and SBIN local
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

#BIN and SBIN systemwide
export PATH=$PATH:/usr/bin:/usr/sbin

#BIN and SBIN for system
export PATH=$PATH:/bin:/sbin

#PDFLATEX AND STUFF
export PATH=$PATH:/usr/texbin

#MacVim executable alias
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Gtest
export GTEST_DIR="$HOME/gtest/"
