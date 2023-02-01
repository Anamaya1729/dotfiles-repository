# if not running interactively, don't do anything
[[ $- != *i* ]] && return

#colorcoding 
black='\[\e[0;30m\]'	# black
red='\[\e[0;31m\]'		# red
green='\[\e[0;32m\]'	# green
yellow='\[\e[0;33m\]'	# yellow
blue='\[\e[0;34m\]'		# blue
purple='\[\e[0;35m\]'	# purple
cyan='\[\e[0;36m\]'		# cyan
white='\[\e[0;37m\]'	# white

# bold
bblack='\[\e[1;30m\]'	# black
bred='\[\e[1;31m\]'		# red
bgreen='\[\e[1;32m\]'	# green
byellow='\[\e[1;33m\]'	# yellow
bblue='\[\e[1;34m\]'	# blue
bpurple='\[\e[1;35m\]'	# purple
bcyan='\[\e[1;36m\]'	# cyan
bwhite='\[\e[1;37m\]'	# white

# Background
on_black='\[\e[40m\]'   # Black
on_red='\[\e[41m\]'     # Red
on_green='\[\e[42m\]'   # Green
on_yellow='\[\e[43m\]'  # Yellow
on_blue='\[\e[44m\]'    # Blue
on_purple='\[\e[45m\]'  # Purple
on_cyan='\[\e[46m\]'    # Cyan
on_white='\[\e[47m\]'   # White
   
NC='\[\e[m\]'           # Color Reset
   
ALERT="${BWhite}${On_Red}" # Bold White on red background

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
alias c='clear'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias ys="yay -s"
alias e="exit"
# alias ll='ls -lisa --color=auto'

## Plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  )

#Zsh Theme
ZSH_THEME='random'

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

## Exports

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# Set PATH so it includes user's private bin directories
export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
# export MANPATH="/usr/local/man:$MANPATH"

## Source Files
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/nvm/init-nvm.sh
