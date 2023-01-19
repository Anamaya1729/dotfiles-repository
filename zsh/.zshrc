# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#33c7de,bg=gray,bold"

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# User configuration

## Aliases
alias u="sudo pacman -Syu --noconfirm"
alias i="sudo pacman -S"
alias y="yay -Syu"
alias r="sudo pacman -Rns"
alias yi="yay -S"
alias ll="exa -la"
alias cat="bat"

## Exports

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Compilation flags
export ARCHFLAGS="-arch x86_64"
export PATH=$PATH:/home/yato/.local/bin/
# export MANPATH="/usr/local/man:$MANPATH"

## Plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  )

## Bullet-Train Configurations
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
  status
)

BULLETTRAIN_PROMPT_CHAR=\$
BULLETTRAIN_PROMPT_ROOT=true
BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_PROMPT_ADD_NEWLINE=true

BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_STATUS_BG=#4b6496
BULLETTRAIN_TIME_12HR=true

BULLETTRAIN_CONTEXT_BG=#234882

BULLETTRAIN_GIT_BG=#9e48a1

## Commands to run at start
neofetch

## Source Files

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source .oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/nvm/init-nvm.sh
