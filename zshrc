if [ -z "$PS1" ]; then
    return
fi


unsetopt hashcmds hashdirs

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ -f ~/.zsh-shortcuts ]; then
  source ~/.zsh-shortcuts
fi

if [ -f ~/.zsh-config ]; then
  source ~/.zsh-config
fi
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tulloch"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git battery z)

# Muscle memory
alias j='z'

source $ZSH/oh-my-zsh.sh
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
__git_files () { 
  _wanted files expl 'local files' _files 
}

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory interactive_comments hist_ignore_dups inc_append_history extended_history

# OPAM configuration
. /Users/tulloch/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
