#!/usr/bin/env sh

# The following fan-base parody was made in collaboration with chatGPT. Please support the official release (I miss dbz abridged)
# https://chatgpt.com/share/7342c1e0-efd5-485f-870e-cf183a35551e

# Define the function to process files
sql_logger() {
	local dblg="mariadb -h db.luddy.indiana.edu -u i308u24_ericwalk --password=my+sql=i308u24_ericwalk -D i308u24_ericwalk"
    # Array of files provided
    local FILES=("$@")

  # Loop through each file in the array
  for FILE in "${FILES[@]}"
  do
    # Check if the item is a file (not a directory)
    if [ -f "$FILE" ]; then
		echo Found $FILE
		$dblg -ct < "$FILE" > "$FILE.log"
		echo Log written to $FILE.log
    else
      echo "Skipping non-file item: $FILE"
    fi
  done
}
