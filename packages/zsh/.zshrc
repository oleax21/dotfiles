# Created by newuser for 5.7.1#

# -------------------------------------
# ######### environment paths #########
# -------------------------------------
# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# My scripts
export PATH=$HOME/dotfiles/scripts:$PATH
# asdf
. /usr/local/opt/asdf/asdf.sh


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
zinit light zsh-users/zsh-autosuggestions # suggestion(補完)
zinit light zdharma/fast-syntax-highlighting # シンタックスハイライト
zinit light zdharma/history-search-multi-word # ctrl+r でコマンド履歴を検索


# -------------------------------------
# ############## starship #############
# -------------------------------------
# Configure your shell to initialize starship.
# .zshrcの最後に記入
eval "$(starship init zsh)"
