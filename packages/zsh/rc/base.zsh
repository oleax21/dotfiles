# -------------------------------------
# ######### Base Configuration ########
# -------------------------------------


# -------------------------------------
#  History
# -------------------------------------
export HISTSIZE=1000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history

# -------------------------------------
#  Completion
# -------------------------------------
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
setopt auto_list # 補完候補を一覧表示
setopt auto_menu # タブで補完を表示
setopt share_history # 複数ターミナルで履歴の共有
setopt auto_param_keys # カッコの対応などを自動的に補完
setopt auto_cd # ディレクトリ名の入力のみで移動
setopt correct # コマンドのスペルチェック
autoload -Uz compinit && compinit -i && compinit # タブ保管用の設定
autoload -Uz up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search && zle -N down-line-or-beginning-search
zstyle ':completion:*:default' menu select=2 # 補完候補を一覧表示したときの選択
zstyle ':completion:*:default' list-colors "$LS_COLORS" # 補完候補に色を付ける
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# -------------------------------------
#  Keymap
# -------------------------------------
