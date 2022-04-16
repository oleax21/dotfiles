# -------------------------------------
# ############## Plugins ##############
# -------------------------------------


# -------------------------------------
#  Setup zinit
# -------------------------------------
## Added by Zinit's installer
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
## End of Zinit's installer chunk

# zinit
zinit light zsh-users/zsh-autosuggestions # suggestion(補完:過去に入力した文字を背景に薄く文字を表示してくれる)
zinit light zsh-users/zsh-completions # 補完強化
zinit light zdharma/fast-syntax-highlighting # シンタックスハイライト
zinit light zdharma/history-search-multi-word # ctrl+r でコマンド履歴を検索
