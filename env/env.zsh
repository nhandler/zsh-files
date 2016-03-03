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

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# history
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history

# shell
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
BULLETTRAIN_DIR_CONTEXT_SHOW=true
