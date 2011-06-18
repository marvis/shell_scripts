#! /bin/sh

if [ "$#" = "0" ]
then
	echo "usage : to_echo_file.sh <plain_file>"
	exit 0
fi

FILENAME=$1

sed "s/'/'\"'\"'/g" $FILENAME | sed "s/^/echo '/" | sed "s/$/'/"
