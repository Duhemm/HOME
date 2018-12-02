autoload -Uz compinit colors vcs_info

. "$HOME/.mini-env"

colors

# Completion
fpath=($HOME/utils/completions $fpath)
fpath=($PROJECTS/zsh-users/zsh-completions/src $fpath)
compinit
setopt complete_in_word
setopt completealiases
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# Correct commands
setopt prompt_subst correct
SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? (Yes [y], No [n], Abort [a], Edit [e]): "

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1024
SAVEHIST=1024
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# Vim mode
bindkey -v

# Browse history using up/down arrows
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Move a whole word with ctrl + arrows
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Various aliases
. "$HOME/.aliases"

# Scala related
alias scala="scala -Dscala.color"

# Git prompt
export GIT_PROMPT_EXECUTABLE="haskell"
source $PROJECTS/Duhemm/zsh-git-prompt/zshrc.sh
PROMPT='$(git_super_status)%{$fg[red]%}%1~%{$reset_color%} %{$fg[white]%}❯%{$reset_color%} '
RPROMPT='%{$fg_bold[red]%}%T%{$reset_color%}'

# Open new tabs in the same directory
precmd() { print -Pn "\e]2; %~/ \a" }
preexec() { print -Pn "\e]2; %~/ \a" }

# See http://superuser.com/a/161922
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    bg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
setopt append_history autocd extended_glob no_match

# Syntax highlighting
source $PROJECTS/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Required for gpg to work:
export GPG_TTY=$(tty)

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
