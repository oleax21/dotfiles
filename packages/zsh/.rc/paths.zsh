# -------------------------------------
# ############### Paths ###############
# -------------------------------------


# openssl
export PATH=/usr/local/opt/openssl@3/bin:$PATH

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
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts:$PATH
