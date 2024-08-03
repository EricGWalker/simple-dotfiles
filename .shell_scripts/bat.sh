#!/usr/bin/env sh

pager='cat'

if  command -v bat &> /dev/null; then 
    pager='bat'
elif command -v batcat &> /dev/null; then
    pager='batcat'
fi
    


alias cat="$pager"
alias bat="$pager"
alias batcat="$pager"

export PAGER="$pager"

alias fp="fzf --preview '$pager --color=always --style=numbers --line-range=:500 {}'"

export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | $pager -l man -p'"  # BATCAT MANPAGER
