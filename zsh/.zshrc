# path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# theme (
ZSH_THEME=""

# plugins 
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting tmux)
export GIT_PAGER=""
export PAGER=""

# load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# prompt: ~/dir (gitbranch) $
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'

PROMPT='%F{green}ark%f %F{cyan}%1~%f %F{yellow}${vcs_info_msg_0_}%f %# '

# autosuggest init 
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ -f "$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# syntax highlight init
if [ -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# fzf config 
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# load personal aliases if they exist
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.aliases_priv" ] && source "$HOME/.aliases_priv"

# z init
eval "$(zoxide init zsh)"

# environment
export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/scripts:$HOME/go/bin:$HOME/bin:$HOME/.local/bin:$PATH"

# less annoying history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks

# fix ^[[A and arrow keys in some terminals
bindkey -e

# autocomplete
autoload -Uz compinit
compinit
bindkey '^ ' autosuggest-accept

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

