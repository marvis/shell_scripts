#! /bin/sh
if [ "$#" -eq "0" ]
then
	echo "usage : getcode.sh <code_name> [option]"
	echo "Use \"getcode.sh !\" to get the supported code list"
	exit 0
fi

if [ "$1" = "!" ] 
then
	echo "Available Codes : v3d_plugin v3d_dialog opengl cpp_main"
	exit 0
fi

CODE_NAME=$1

shift
command="create_code_$CODE_NAME.sh $@"
eval "$command"
