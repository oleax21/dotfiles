# -------------------------------------
# ############# Functions #############
# -------------------------------------


# -------------------------------------
#  fzf
# -------------------------------------
cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# -------------------------------------
#  other
# -------------------------------------
function init_gitoleax21() {
  git config --local user.name "shuhei"
  git config --local user.email "72839906+oleax21@users.noreply.github.com"
  git config --local user.signingkey 7185BE360330FAE7!
  git config --local url."github-oleax21".insteadOf "git@github.com"
}
