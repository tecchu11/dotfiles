# P10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Added by Zinit's installer
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

zinit wait lucid light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# Additional Configuration
zinit wait lucid light-mode for \
    zsh-users/zsh-completions \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

# p10k config with zinit
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Configure the homebrew auto completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  
  autoload -Uz compinit
  compinit
fi

# Language
export LANG=ja_JP.UTF-8

# Git
export PATH=/usr/bin/git:$PATH

# Custom alias
alias  ls='ls -Ga'

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# pip and pipenv
eval "`pip completion --zsh`"
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# npm
source <(npm completion zsh)

# terraform (via terraform --install-autocomplete)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C ${HOME}/.asdf/shims/terraform terraform
