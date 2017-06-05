export LC_CTYPE=en_US.UTF-8

alias p=print
alias cls='clear'
alias del='rm'
alias which='which -a'
alias ll='ls -lAFGHh'
alias la='ls -AFG'

alias e='emacsclient --no-wait'
alias ee='e --create-frame'

# python
alias py='python3 -B'
alias pyre='py -i'
alias pip='pip3'

# erlang
alias erlich='erl -man'

# stack
alias sr='stack ghci'
alias sc='stack clean'
alias sb='stack build'
alias se='stack exec'

alias df='df -H'
alias q='tmux attach || tmux new'
alias top='top -o cpu'
alias ips='ifconfig | grep inet'
alias pc='rsync -Ph' # -P same as --partial --progress
alias md5sum='md5 -r'
alias ra='ranger'
alias btli="btcli list | grep -e '[LI+]\.\s'"
alias ltr="py ~/.etc/ltr.py"
alias ww="qlmanage -p $@ >& /dev/null"

# alias java9='export JAVA_HOME=$(/usr/libexec/java_home -v 1.9)'

autoload -U colors && colors
# todo: replace ANSI by supported xterm-256color
export LSCOLORS='Exfxcxdxbxegedabagacad'
export CLICOLOR_FORCE=true
alias less='less -r'
alias more='more -r'

# [hrls@probe /bin]$ default prompt
# [root@probe /var]# root prompt todo
# user @ machine  ~ λ
PROMPT=$'%{\e[38;5;255m%}[%{\e[38;5;193m%}%n%{\e[38;5;75m%}@%{\e[38;5;193m%}%m %{\e[38;5;190m%}%~%{\e[38;5;255m%}]%{\e[38;5;178m%}$%{\e[0m%}'

bindkey -e # emacs

fpath=( ~/.etc/zsh "${fpath[@]}" )
autoload -U misc && misc
autoload -U add_env && add_env

export src=$HOME/src
export tmp=$HOME/tmp
export sdr=/Volumes/rttr

# db
# add_pgs

export PATH=$PATH:$HOME/.local/bin

# ejabberd
export EJABBERD_HOME=$HOME/.local/ejabberd
export PATH=$EJABBERD_HOME/sbin:$PATH
alias ej=ejabberdctl
alias ejss='ej status'
alias ejmc='ej module_check'
alias ejma='ej modules_available'
alias ejmi='ej module_install'
alias ejmu='ej module_uninstall'
alias ejmd='ej modules_installed'
alias ejup='ej module_upgrade'
alias ejlogs='cd $EJABBERD_HOME/var/log/ejabberd'

# todo: replace by emacs
# export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerm"'

# batteries
eval "$(thefuck --alias)"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# if [[ $TERM != "screen" ]] then
    # ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
    # echo "error: tmux failed to start"
# fi

if [ -f ~/.private ]; then
	source ~/.private
fi
