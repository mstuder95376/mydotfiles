#!/bin/bash
# Install dot files to local system
#
read -p "Select OS, OSX (1), Linux (2), Solaris (3): " myos
if [ $myos -eq 1 ]; then
	ospath="./OSX/"
elif [ $myos -eq 2 ]; then
	ospath="./Linux/"
elif [ $myos -eq 3 ]; then
	ospath="./Solaris/"
else
	echo "Unknown OS selected. Exiting"
	exit 1
fi

cd $ospath
pwd
ls -la
