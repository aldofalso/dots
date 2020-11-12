# .zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#zsh hystory
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable colors and change prompt:
autoload -U colors && colors

#alias
alias ls='ls --color=auto'
alias vim='nvim'
alias vi='nvim'

#autocd
setopt auto_cd

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

#themes stuff
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config//zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/spaceship-prompt/spaceship.zsh
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
