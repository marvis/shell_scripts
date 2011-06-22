#! /bin/sh
if [[ "$#" = "0" || "$1" = "!" ]]; then
	echo "usage : create_code_cpp.sh <code_name>"
	echo ""
	echo "Available Codes: cpp_main platform"
	echo ""
	if [ "1" ]; then
		echo "cpp_main  #  create main.cpp and makefile"
		echo "platform  #  check the bit of macos"
		echo "split     #  create split.cpp used to split char * to char **"
	fi | column -t -s \#
	exit 0
fi

CPPPATH=`which getcode.sh`
CPPPATH="`dirname $CPPPATH`/cpp"

eval "$CPPPATH/$1.sh"
