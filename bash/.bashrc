
## Set prompt to display path to current directory and git branch
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]\w\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\] \[\e[31m\]\\$\[\e[m\] "

source /usr/share/nvm/init-nvm.sh
# rvm related stuff below probably not needed
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias nginxStart='sudo /opt/nginx/sbin/nginx'
alias nginxStop='sudo kill $(cat /opt/nginx/logs/nginx.pid)'
alias nginxRestart='nginxStop && nginxStart'
alias nginxStatus='ps auxw | grep nginx && sudo passenger-memory-stats'

alias elasticsearch='/home/janis/perm/elasticsearch-2.4.6/bin/elasticsearch'


alias mp='cd ~/projects/moviepilot.de'
alias mn='cd ~/projects/moviepilot-next'

alias ll='ls -la'
alias uni='cd ~/uni_ss20'

# Needs to be run several times some times
function bootMP {
  nginxStart
  nginxStatus
  elasticsearch &
  redis-server &
}

function bootNext {
  bootMP
  cd /home/janis/Code/moviepilot-next
  yarn dev
}

# monitor alignment, in order t not use arandr graphical...
# TODO: replace output monitor
#function displayLeftsideExternal {
#  xrandr --output eDP1 --auto --output DP-1-3 --auto --left-of eDP-1-1

#  if [ -f ~/Dotfiles/polybar/launch.sh ]; then
#      sh ~/Dotfiles/polybar/launch.sh
#  fi
#}

# alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
# alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# Unlimited bash history
HISTSIZE=-1
HISTFILESIZE=-1
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Installation directory of tomcat
export CATALINA_HOME=/usr/share/tomcat9

