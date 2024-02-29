# locale-gen
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=C

# znap setup
[[ -r ~/.znap/znap/znap.zsh ]] || git clone https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh
znap eval starship "starship init zsh --print-full-init"
znap prompt

znap source ohmyzsh/ohmyzsh  plugins/git
znap source "zsh-users/zsh-autosuggestions"
znap source "zsh-users/zsh-completions"
znap source "changyuheng/zsh-interactive-cd"

znap source "zsh-users/zsh-syntax-highlighting"

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

alias ls='eza'
alias l='eza'
alias ll='eza -l'
alias vim='nvim'
alias lg='lazygit'

export GOPATH=$HOME/go
path+=$GOPATH/bin

#export VOLTA_HOME="$HOME/.volta"
#export PATH="$VOLTA_HOME/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
