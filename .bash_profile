 #function start_agent {
 #    echo "Initialising new SSH agent..."
 #    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
 #    echo succeeded
 #    chmod 600 "${SSH_ENV}"
 #    . "${SSH_ENV}" > /dev/null
 #    /usr/bin/ssh-add;
 #}
 #
 ## Source SSH settings, if applicable
 #
 #if [ -f "${SSH_ENV}" ]; then
 #    . "${SSH_ENV}" > /dev/null
 #    #ps ${SSH_AGENT_PID} doesn't work under cywgin
 #    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
 #        start_agent;
 #    }
 #else
 #    start_agent;
 #fi



 # @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
 # Shamelessly copied from https://github.com/gf3/dotfiles
 [ -z "$PS1" ] && return
 if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
   export TERM=gnome-256color
 elif infocmp xterm-256color >/dev/null 2>&1; then
   export TERM=xterm-256color
 fi

 if tput setaf 1 &> /dev/null; then
   tput sgr0
   if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
     MAGENTA=$(tput setaf 5)
     ORANGE=$(tput setaf 172)
     GREEN=$(tput setaf 190)
     PURPLE=$(tput setaf 141)
     WHITE=$(tput setaf 0)
     CYAN=$(tput setaf 6)
   else
     MAGENTA=$(tput setaf 5)
     ORANGE=$(tput setaf 4)
     GREEN=$(tput setaf 2)
     PURPLE=$(tput setaf 1)
     WHITE=$(tput setaf 7)
     CYAN=$(tput setaf 6)
   fi
   BOLD=$(tput bold)
   RESET=$(tput sgr0)
 else
   MAGENTA="\033[1;31m"
   ORANGE="\033[1;33m"
   GREEN="\033[1;32m"
   PURPLE="\033[1;35m"
   WHITE="\033[1;37m"
   BOLD=""
   RESET="\033[m"
 fi

 export MAGENTA
 export ORANGE
 export GREEN
 export PURPLE
 export WHITE
 export BOLD
 export RESET

 function parse_git_dirty {
   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
 }

 function parse_git_branch() {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/*\(.*\)/\1$(parse_git_dirty)/"
 }

 if [ "x${SSH_TTY}" = "x" ]; then
   export PS1="\[${BOLD}${CYAN}\]\u \[$MAGENTA\]\W\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on\")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\] \$ \[$RESET\]"
   export PS2="\[$ORANGE\]→ \[$RESET\]"
 fi
 export NVM_DIR=~/.nvm
#Source might have an exit, which means the rest of the bash profile might not
#be exec;
 source $(brew --prefix nvm)/nvm.sh
 source ~/.bashrc
 PATH=/opt/local/bin:$PATH
 alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --disable-web-security"
 alias chrome_local="chrome http://localhost:3000 --new-window"
 alias work="
   chrome_local --window-size=600x800 --window-position=500,300 &
   chrome_local --window-size=300x200 &
   chrome_local --window-size=300x200 &
   chrome_local --window-size=300x200 &
   chrome_local --window-size=300x200
 "

export PATH=$PATH:~/Work/depot_tools
# export JAVA_HOME=`/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java`
