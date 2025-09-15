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

zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
zinit light "changyuheng/zsh-interactive-cd"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "mio9/zsh-git-jump"

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)


alias ls='eza'
alias l='ls'
alias ll='eza -l'
alias vim='nvim'
alias lg='lazygit'
alias lad='lazydocker'
alias t='tmux'
alias zl='zellij'
alias zt='zerotier-cli'
alias code='codium'

# docker compose stuffs
updown ()
{
  docker compose down && docker compose up -d
}
alias ddown='docker compose down'
alias dup='docker compose up -d'

whothefuckami(){
  echo "Bruh wakeup, you're motherfucking $(whoami) mate, you even ask who tf you are..!?"
}
mkcd () {
  mkdir "$1" && cd "$1"
}

eval "$(zoxide init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/mio9/.bun/_bun" ] && source "/Users/mio9/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# personal bins
export PATH="$HOME/bin:$PATH"

# go bins
path+="$HOME/go/bin"


# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi
