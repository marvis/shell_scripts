#! /bin/sh

if [ "$#" = "0" ]; then
	echo "usage : create_code_opengl.sh <code_name> [option] <os_type>"
	echo "Use \"create_code_opengl.sh !\" to display the detailed information."
	exit 0
fi

if [ "$1" = "!" ]; then
	echo "code_name : smoke nehe qt"
	echo "os_type   : macos linux"
	echo ""
	echo "nehe includes many opengl course, the option is the lesson's number."
	if [ "1" ] ; then
		echo "01 #   An OpenGL Window"
		echo "02 #   First Polygon"
		echo "03 #   Adding Color"
		echo "04 #   Rotation"
		echo "05 #   3D Shapes"
		echo "06 #   Texture Mapping"
		echo "07 #   Texture Filters, Lighting & Keyboard Control"
	fi | column -t -s \#
	exit 0
fi

CODE_TYPE=$1
CODE_NAME=$2
OS_TYPE=$3
GC_PATH=`which getcode.sh`
OPENGL_SCRIPT_PATH="`dirname $GC_PATH`/opengl"

if [ "$OS_TYPE" = "" ]; then 
	uname=`uname`
	if [ "$uname" = "Darwin" ]; then
		OS_TYPE="macos"
	else
		OS_TYPE="linux"
	fi
fi

if [ "$1" = "nehe" ]; then
	if [[ "$CODE_NAME" = "" || "$CODE_NAME" = "macos" || "$CODE_NAME" = "linux" || "$OS_TYPE" = "" ]]; then
		if [ "1" ] ; then
			echo "01 #   An OpenGL Window"
			echo "02 #   First Polygon"
			echo "03 #   Adding Color"
			echo "04 #   Rotation"
			echo "05 #   3D Shapes"
			echo "06 #   Texture Mapping"
			echo "07 #   Texture Filters, Lighting & Keyboard Control"
		fi | column -t -s \#
	else
		eval "$OPENGL_SCRIPT_PATH/${CODE_TYPE}_${CODE_NAME}_${OS_TYPE}.sh"
	fi
elif [ "$1" = "" ]; then :
fi
