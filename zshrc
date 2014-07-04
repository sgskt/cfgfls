# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philips"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby gem brew rails)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Other stuff
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:/bin:/sbin:/usr/local/git/bin

#RUBY
export PATH=$PATH:/Users/simongeorges/.rvm/gems/ruby-1.9.3-p327/bin:/Users/simongeorges/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/simongeorges/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/simongeorges/.rvm/bin

#PORT
#export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/X11/bin

#FINK
#export PATH=$PATH:/sw/bin

#BIN and SBIN local
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

#BIN and SBIN systemwide
export PATH=$PATH:/usr/bin:/usr/sbin

#BIN and SBIN for system
export PATH=$PATH:/bin:/sbin

#PDFLATEX AND STUFF
export PATH=$PATH:/usr/texbin

#EDP PYTHON
#export PATH=/Library/Frameworks/EPD64.framework/Versions/Current/bin:$PATH

#MacVim executable alias
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Selenium server
#export SELENIUM_SERVER_JAR=~/Documents/Scolaire/APE/M2T/data/train/selenium-server-standalone.jar
#export PATH=$PATH:/Users/simongeorges/Documents/Scolaire/APE/M2T/data/train

# ANDROID SDK
export PATH=$PATH:/Users/simongeorges/Development/android-sdk/tools

# MSF
export PATH=$PATH:/usr/local/msf
