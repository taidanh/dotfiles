# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep

bindkey "^[[98;9u" backward-word
bindkey "^[[102;9u" forward-word
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tai/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# SELF ADDED

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias py=python3
alias vim=nvim
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias gcam="git commit -am"
alias gls="git ls-files"
alias ls="eza"
alias ll="eza -la"
alias cat="bat"
alias icat="kitty +kitten icat"
alias cls="clear; exa"

monitor() {
    tail -f $1 | bat --paging=never -l log
}

mkcd() {
    mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

autoload -U colors
colors

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Monokai Extended Light"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}%b:%r%f'
zstyle ':vcs_info:*' enable git

# PROMPT='%B%F{cyan}%n@%f %2~ > '

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd j)"

export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.config/cellar/scripts:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
# export PATH="/Users/admin.tmdanh/.local/bin/:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  [ -f "/Users/taidanh/.ghcup/env" ] && source "/Users/taidanh/.ghcup/env" # ghcup-env

GOPATH="/opt/homebrew/bin/go"

source /Users/taidanh/.config/broot/launcher/bash/br
source "$HOME/.rye/env"
