autoload -Uz compinit colors vcs_info

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

colors

# Completion
fpath=(/Users/martin/Documents/Projects/zsh-users/zsh-completions/src $fpath)
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
HISTFILE="/Users/martin/.zsh_history"
HISTSIZE=1024
SAVEHIST=1024
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# Browse history using up/down arrows
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Various aliases
alias -g ...="../.."
alias cdp=". /Users/martin/Scripts/cdp"
alias ls="ls --color=auto"
alias editprofile="subl -n $HOME/.zshrc"
alias reloadprofile="source $HOME/.zshrc"
alias editscripts="subl $HOME/Scripts"
alias grep="grep --color=auto"
alias switchj6="export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home && pushd /System/Library/Frameworks/JavaVM.framework/Versions && sudo rm Current && sudo ln -s CurrentJDK Current && popd"
alias switchj7="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home && pushd /System/Library/Frameworks/JavaVM.framework/Versions && sudo rm Current && sudo ln -s A Current && popd"
alias switchj8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home && pushd /System/Library/Frameworks/JavaVM.framework/Versions && sudo rm Current && sudo ln -s 1.8 Current && popd"

# Use coreutils rather than OS X version of utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# My projects...
export PROJECTS="$HOME/Documents/Projects"

# Sublime text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Scala related
export PATH="$HOME/Applications/scala/scala-latest/bin:$PATH"
export PATH="$HOME/Applications/sbt:$PATH"
export PATH="$HOME/Applications/activator/activator-latest:$PATH"
export PATH="$HOME/Applications/play/play-latest:$PATH"
alias scala="scala -Dscala.color"
alias xsbt="sbt -sbt-jar /Users/martin/Documents/Projects/Duhemm/sbt/target/sbt-launch-0.13.8-SNAPSHOT.jar"
alias resetsbt="rm -rf ~/.sbt/boot/ && rm -rf ~/.ivy2/cache/org.scala-sbt/compiler-interface-bin_2.11.*"
alias rst="resetsbt && xsbt"
alias qsc="/Users/martin/Documents/Projects/Duhemm/scala/build/quick/bin/scalac -language:experimental.macros -d sandbox -Dscala.color"
alias qs="/Users/martin/Documents/Projects/Duhemm/scala/build/quick/bin/scala -language:experimental.macros -cp sandbox -Dscala.color"
alias pmscala="scala -Xplugin:/Users/martin/.ivy2/cache/org.scalamacros/paradise_2.11.6/jars/paradise_2.11.6-2.1.0-M5.jar -Xplugin:/Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar -cp /Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar -Dscala.color"
alias pmscalac="scalac -Xplugin:/Users/martin/.ivy2/cache/org.scalamacros/paradise_2.11.6/jars/paradise_2.11.6-2.1.0-M5.jar -Xplugin:/Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar -cp /Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar:sandbox:."

# Git prompt
export GIT_PROMPT_EXECUTABLE="haskell"
source /Users/martin/Documents/Projects/olivierverdier/zsh-git-prompt/zshrc.sh
PROMPT='$(git_super_status)%{$fg[red]%}%1~%{$reset_color%} %{$fg[black]%}❯%{$reset_color%} '
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

# Hadoop
alias hstart="/usr/local/Cellar/hadoop/2.7.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/stop-dfs.sh"

# Spark
alias sshell="HADOOP_CONF_DIR=/usr/local/Cellar/hadoop/2.7.0/libexec/etc/hadoop spark-shell --master yarn"

# Syntax highlighting
source /Users/martin/Documents/Projects/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Terminal notification for long running command
source /Users/martin/Documents/Projects/marzocchi/zsh-notify/notify.plugin.zsh

# My own completion scripts
fpath=($PROJECTS/Duhemm/scripts/completions $fpath) 
