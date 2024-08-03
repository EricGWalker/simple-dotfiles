# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash 

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview '$PAGER -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using pbcopy
## export FZF_CTRL_R_OPTS="
##   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
##   --color header:italic
##   --header 'Press CTRL-Y to copy command into clipboard'"


# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'


# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$PAGER -n --color=always {}" "$@" ;;
  esac
}
