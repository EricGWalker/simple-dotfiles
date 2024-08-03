#!/usr/bin/env sh

program=""

if  command -v fd &> /dev/null; then 
    program='fd'
elif command -v fdfind &> /dev/null; then
    program='fdfind'
fi
    


if [[ -z $program ]]; then 
    return 0
fi

# Can assert that fd or fdfind is installed

alias fd="$program"
alias fdfind="$program"
export FZF_DEFAULT_COMMAND="$program --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  $program --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  $program --type d --hidden --follow --exclude ".git" . "$1"
}
