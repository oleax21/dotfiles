###############################################
#################### zshrc ####################
###############################################
# .zshenv -> .zprofile -> .zshrc
# .zshenv   : login, interactive, shellscript
# .zprofile : login
# .zshrc    : login, interactive
###############################################


# -------------------------------------
# ############### Paths ###############
# -------------------------------------
# Go
export GOPATH=$HOME/dev/.go
export PATH=$GOPATH/bin:$PATH
# My Paths
export MYGIT_CLONE_PATH=$HOME/dev/.ghq/github.com/oleax21
export PATH=$MYGIT_CLONE_PATH/dotfiles/scripts:$PATH
# asdf
. /usr/local/opt/asdf/asdf.sh


# -------------------------------------
# ############## Aliases ##############
# -------------------------------------
# common
alias g='git'
alias c='code'
alias cl='clear'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias ..='cd ..'

# chmod
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

# -------------------------------------
# ############### Zinit ###############
# -------------------------------------
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Pulugins
zinit light zsh-users/zsh-autosuggestions # suggestion(補完:過去に入力した文字を背景に薄く文字を表示してくれる)
zinit light zdharma/fast-syntax-highlighting # シンタックスハイライト
zinit light zdharma/history-search-multi-word # ctrl+r でコマンド履歴を検索


# -------------------------------------
# ############## starship #############
# -------------------------------------
# Configure your shell to initialize starship.
# .zshrcの最後に記入
eval "$(starship init zsh)"
