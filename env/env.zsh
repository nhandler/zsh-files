#  Environment Variables

# general
export SSH_KEY_PATH="~/.ssh/dsa_id"
export TERM=xterm-256color

# encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# applications
export EDITOR='vim'
export BROWSER='firefox'

# virtualenvwrapper
export WORKON_HOME=~/docs/envs
export PROJECT_HOME=~/docs/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7 

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# path
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.1.0/bin"
export PATH="$PATH:/opt/vc/bin"
export PATH="$PATH:$HOME/.rvm/bin"

# history
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history

# shell
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
