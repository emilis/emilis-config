# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias la='ls -A'
alias ll='ls -l'
alias lh='ls -lSh'
alias l='ls -CF'

# some cd aliases
alias ..='cd ..'

# du aliases
alias duh='du -sh'
duh1() {
    du -h --max-depth=1 "$@" | sort -h
}

# various aliases
alias ':e'='vim'
alias ':WM'='make'
alias earlier='touch -d 1999-12-31'
alias rbackup='rsync -ghlport'
alias capitalize='sed "s/./\U&/"'

# git aliases
alias gis='git status'
alias gif='git diff'
alias gic='git commit -m'
alias gica='git commit -am'
alias gil="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

# mercurial aliases
alias hgu='hg update'
alias hgb='hg bookmark'
alias hgs='hg bookmarks;hg status'
alias hgraph='hg serve | sensible-browser http://localhost:8000/graph'
hgif() {
    hg diff -g --color always "$@" | less -SR
}

#node aliases
alias ntree='tree -I node_modules'
