#! /bin/sh
if [[ "$#" -eq "0" || "$1" = "!" ]]
then
	echo "usage : getcode.sh <code_name> [option]"
	echo ""
	echo "Available Codes : v3d_plugin v3d_dialog opengl cpp shell_script"
	echo ""
	if [ "1" ]; then
		echo "v3d_plugin #   produce v3d plugin template and project"
		echo "v3d_dialog #   produce v3d dialog header invoked by v3d plugin"
		echo "opengl     #   produce opengl program framework"
		echo "cpp        #   produce cpp code"
		echo "shell_script #   produce many useful shell scripts"
	fi | column -t -s \#
	echo ""
		exit 0
	fi

	CODE_NAME=$1

	shift
	command="create_code_$CODE_NAME.sh $@"
	eval "$command"
