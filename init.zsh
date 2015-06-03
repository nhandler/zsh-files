SOURCE=${0%/*}

# aliases
source $SOURCE/aliases/aliases.zsh

# colors
source $SOURCE/colors/colors.zsh

# functions
source $SOURCE/functions/functions.zsh

# env
source $SOURCE/env/env.zsh
source $SOURCE/env/shell.zsh

# install virtualenvwrapper if not installed
# make sure to install it to user to avoid affecting the system
pip_freeze=$(pip freeze 2> /dev/null)
[[ $pip_freeze != *"virtualenvwrapper"* ]] && pip install --user virtualenvwrapper
