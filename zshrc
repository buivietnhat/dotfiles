# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    source "$BASE16_SHELL/profile_helper.sh"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)    

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=064,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=064,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=064,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=064,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=064,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
ZSH_HIGHLIGHT_STYLES[assign]=fg=037

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#808080,bold,underline'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting	
  )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zs


# Enable vi mode
bindkey -v

# aliases
source ~/.aliases

# source the ultility functions
source ~/.functions

# the personalize for specific env
source ~/.zsh_personal

# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Automatically start tmux if not already inside a tmux session
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
