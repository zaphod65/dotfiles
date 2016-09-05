autoload -Uz promptinit && promptinit
prompt walters

alias ls='ls -F --color=auto'
alias ll='ls -lha'
alias reset='reset -Q'
alias rl='reset && ls'
alias la='ls -a'
alias view='vim -R "+syntax on" "+set number" "+colo delek"'
alias iftop='sudo iftop'
alias moci='mocp --info'
alias top='htop'
alias fucking='sudo'

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zshhist

bindkey -e

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

autoload -U compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

if [[ ! $PATH == *"xmobin"* ]]
then
	export PATH=$PATH:/home/zaphod/.bin:/home/zaphod/.xmobin
fi

export EDITOR=vim

function rand {
	echo $[RANDOM % $1+1]
}

function empty {
	echo -n '' > $1
}
