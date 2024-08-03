#!/usr/bin/env bash


_ZO_FZF_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'tree -C {}'"

eval "$(zoxide init bash)"

alias cd='z'
alias cdi='zi'

