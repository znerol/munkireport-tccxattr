#!/bin/bash

# tccxattr controller
CTL="${BASEURL}index.php?/module/tccxattr/"

# Get the scripts in the proper directories
"${CURL[@]}" "${CTL}get_script/tccxattr" -o "${MUNKIPATH}preflight.d/tccxattr"

# Check exit status of curl
if [ $? = 0 ]; then
	# Make executable
	chmod a+x "${MUNKIPATH}preflight.d/tccxattr"

	# Set preference to include this file in the preflight check
	setreportpref "tccxattr" "${CACHEPATH}tccxattr.txt"

else
	echo "Failed to download all required components!"
	rm -f "${MUNKIPATH}preflight.d/tccxattr"

	# Signal that we had an error
	ERR=1
fi
