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

# Browse history using up/down arrows
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Emacs
#alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs -nw"

# Various aliases
. "$HOME/.aliases"

# Scala related
alias scala="scala -Dscala.color"
alias xsbt="sbt -sbt-jar /Users/martin/Documents/Projects/Duhemm/sbt/launch/target/sbt-launch.jar"
alias resetsbt="rm -rf ~/.sbt/boot/scala-2.10.6/org.scala-sbt/sbt/0.13.13-SNAPSHOT/ && rm -rf ~/.ivy2/cache/org.scala-sbt/org.scala-sbt-compiler-interface-*"
alias rst="resetsbt && xsbt"
alias qsc="/Users/martin/Documents/Projects/Duhemm/scala/build/quick/bin/scalac -language:experimental.macros -d sandbox -Dscala.color"
alias qs="/Users/martin/Documents/Projects/Duhemm/scala/build/quick/bin/scala -language:experimental.macros -cp sandbox -Dscala.color"
alias pmscala="scala -Xplugin:/Users/martin/.ivy2/cache/org.scalamacros/paradise_2.11.6/jars/paradise_2.11.6-2.1.0-M5.jar -Xplugin:/Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar -cp /Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar:. -Dscala.color"
alias pmscalac="scalac -Xplugin:/Users/martin/.ivy2/cache/org.scalamacros/paradise_2.11.6/jars/paradise_2.11.6-2.1.0-M5.jar -Xplugin:/Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar -cp /Users/martin/Documents/Projects/Duhemm/parsermacro/plugin/target/scala-2.11/fat-plugin.jar:sandbox:."

# Git prompt
export GIT_PROMPT_EXECUTABLE="haskell"
source $PROJECTS/olivierverdier/zsh-git-prompt/zshrc.sh
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

# Hadoop
alias hstart="/usr/local/Cellar/hadoop/2.7.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/stop-dfs.sh"

# Spark
alias sshell="HADOOP_CONF_DIR=/usr/local/Cellar/hadoop/2.7.0/libexec/etc/hadoop spark-shell --master yarn"

# Syntax highlighting
source $PROJECTS/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Terminal notification for long running command
source $PROJECTS/marzocchi/zsh-notify/notify.plugin.zsh

# Switch version of Java
use-java () {
  export JAVA_HOME=`/usr/libexec/java_home -v 1.$1`
}

# Create build.properties file for sbt
sbt-set-version () {
  echo "sbt.version=$1" >> project/build.properties
}

source $HOME/.sandbox
