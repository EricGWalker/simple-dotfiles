# global definitions

## set the umask, which controls the permissions on new files you create.
##   022 denies write access to other people, but not read access.
##   077 denies read and write access to other people.
umask 077

# END OF IU DEFAULT BS STUFF, I don't know what this is for but I trust these parts of the file are important (specifically the /etc/bashrc part)

source ~/.shell_scripts/options.sh
source ~/.shell_scripts/aliases.sh
source ~/.shell_scripts/bat.sh
source ~/.shell_scripts/fd.sh
source ~/.shell_scripts/lfcd.sh
source ~/.shell_scripts/log_sql_output.sh
source ~/.shell_scripts/dblg_student.sh
source ~/.shell_scripts/fzf-options.sh
source ~/.shell_scripts/reverse_firefox-tab.sh
#source ~/.shell_scripts/fzf-bash-completion.sh
#bind -x '"\t": fzf_bash_completion'

# for pget (non sudo apt installation script found from:)
# https://github.com/0x00009b/pkget/tree/master


