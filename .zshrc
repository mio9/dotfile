# locale-gen
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=C

### zinit setup
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# plugins
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

zi light "zsh-users/zsh-autosuggestions"
zi light "zsh-users/zsh-completions"
zi light "changyuheng/zsh-interactive-cd"
zi light "zsh-users/zsh-syntax-highlighting"

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

alias ls='eza'
alias l='eza'
alias ll='eza -l'
alias vim='nvim'
alias lg='lazygit'
alias zl='zellij'

# custom commands
mkcd () {
  mkdir "$1" && cd "$1"
}
gj () {
  repo_path=$(git rev-parse --show-toplevel)
  if [[ -z "$repo_path" ]] then
    echo "You are at $(pwd)";
  elif [[ -z "$1" ]] then
    cd $repo_path
  else
    selection=$(cd $repo_path && find $repo_path -type d -maxdepth 2 | grep -v "node_modules" | fzf --query="$1")
    if [[ -n "$selection" ]] then
      cd $selection
    fi
  fi
}

eval "$(zoxide init zsh)"

export GOPATH=$HOME/go
path+=$GOPATH/bin

#export VOLTA_HOME="$HOME/.volta"
#export PATH="$VOLTA_HOME/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
