# -------------------------------------
# ############### Paths ###############
# -------------------------------------


# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
export ASDF_DATA_DIR="/Users/oleax21/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# yarn
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

# Foundly
export PATH="$PATH:/Users/oleax21/.foundry/bin"

# My Paths
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts:$PATH
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts/foundry:$PATH
