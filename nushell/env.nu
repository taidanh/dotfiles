$env.config = {
  buffer_editor: lvim,
  show_banner: false,
}
$env.EDITOR = lvim

alias py = python3
alias vim = nvim
alias ga = git add
alias gc = git commit
alias gp = git pull
alias gs = git status
alias gcam = git commit -am
alias gls = git ls-files
alias ls = eza
alias ll = eza -la
alias cat = bat
alias icat = kitty +kitten icat
alias cls = clear; eza
alias opn = ^open

def monitor [filename] {
    tail -f $filename | bat --paging=never -l log
}

def mkcd [dirname] {
    mkdir $dirname
    cd $dirname
}

$env.PATH = ($env.PATH | split row (char esep)
  | prepend ($env.HOME + '/some/path')
  | prepend ($env.HOME + '/.emacs.d/bin')
  | prepend ($env.HOME + '/.config/bin')
  | prepend ($env.HOME + '/.config/cellar/scripts')
)
# homebrew
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

# still need to convert, not sure if necessary
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#   [ -f "/Users/taidanh/.ghcup/env" ] && source "/Users/taidanh/.ghcup/env" # ghcup-env

use ~/.cache/starship/init.nu
source ~/.local/share/atuin/init.nu
source ~/.local/share/zoxide/zoxide.nu
