# Execute XDG-OPEN on local computer via ssh

alias rco="reverse_cgi_open"
alias cgiurl="get_cgi_url"

reverse_firefox-tab() {
	ssh -o LogLevel=QUIET -t lpc "quickscripts/burrow_to_local/local_firefox-tab.sh $1"
}


# Time to do some cursed shit b/c I have 26 hours to get work done so sprinting time here we go.


reverse_cgi_open(){
	if [[ $# == 0 ]]; then
		echo "No Files Provided"
        return 2
	fi

	for FILE in "$@"; do
        local FILE_URL=$(get_cgi_url $FILE)
        reverse_firefox-tab $FILE_URL
	done
}

get_cgi_url() {
	# if $1 is not set then set it to "."
	local EXPECTED_CGI_PATH=$(readlink -f ~/cgi-pub)
	local CGI_URL="https://cgi.luddy.indiana.edu/~$USER/"

	if [[ $# == 0 ]]; then
		echo "No Files Provided"
        return 2
	fi
    
    local FILE_PATH=$(realpath $1)

    # True if FILE_PATH in ~/cgi-pub
    if [[ $FILE_PATH  == $EXPECTED_CGI_PATH* ]]; then
        local SCOPE_PATH=$(echo $FILE_PATH | sed -e "s/^.*cgi-pub\/\(.*\)/\1/")
        local FILE_URL="$CGI_URL$SCOPE_PATH"

        # Openes the url with another custom file that should be sourced
        echo $FILE_URL
        return 0
    else
        echo $FILE_PATH is not within $EXPECTED_CGI_PATH
        return 22
    fi
}

