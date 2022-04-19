################################################
#################### zshenv ####################
################################################
# .zshenv -> .zprofile -> .zshrc
# .zshenv   : login, interactive, shellscript
# .zprofile : login
# .zshrc    : login, interactive
################################################


# -------------------------------------
# ################ Paths ##############
# -------------------------------------
# asdf
. /usr/local/opt/asdf/asdf.sh
export PATH=$(yarn global bin):$PATH
# Go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH
# fzf
export FZF_DEFAULT_COMMAND=
export FZF_DEFAULT_OPTS=
# My Paths
export MYGIT_CLONE_PATH=$HOME/dev/ghq/github.com/oleax21
export ZDIR=$MYGIT_CLONE_PATH/dotfiles/packages/zsh
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts:$PATH
