# -------------------------------------
# ############### Paths ###############
# -------------------------------------


# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="$(yarn global bin):$PATH"

# Go
# export GOPATH=$HOME/.go
# export PATH=$GOPATH/bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND=
# export FZF_DEFAULT_OPTS=

# GPG
export GPG_TTY=$(tty)

# My Paths
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts:$PATH
