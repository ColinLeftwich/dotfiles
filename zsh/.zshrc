export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(
    vi-mode
    git
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="nvim"

# Configure rust utils as default
alias ls='eza --group-directories-first --icons'
#alias cat='bat'
alias cd='z'
alias jt='zi'
