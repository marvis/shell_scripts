#! /bin/sh

if [[ "$#" = "0" || "$1" = "!" ]]; then
	echo "usage : create_code_opengl.sh <code_name> [option] <os_type>"
	echo ""
	echo -e "The command will produce opengl codes. The os_type is macos or linux. If omited, it will be current os type."
	echo ""
	echo -e "Available Codes : smoke nehe qt"
	echo ""
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
		echo "Available Codes :"
		if [ "1" ] ; then
			echo "01 #   An OpenGL Window"
			echo "02 #   First Polygon"
			echo "03 #   Adding Color"
			echo "04 #   Rotation"
			echo "05 #   3D Shapes"
			echo "06 #   Texture Mapping"
		fi | column -t -s \#
	else
		eval "$OPENGL_SCRIPT_PATH/${CODE_TYPE}_${CODE_NAME}_${OS_TYPE}.sh"
	fi
elif [ "$1" = "smoke" ]; then
	if [[ "$CODE_NAME" = "" || "$CODE_NAME" = "macos" || "$CODE_NAME" = "linux" || "$OS_TYPE" = "" ]]; then
		echo "Available Codes :"
		if [ "1" ]; then
			echo "framework #   produce opengl smoke program based on framework"
			echo "x11 #   produce opengl smoke program based on x11"
		fi | column -t -s \#
	else
		eval "$OPENGL_SCRIPT_PATH/${CODE_TYPE}_${CODE_NAME}_${OS_TYPE}.sh"
	fi
elif [ "$1" = "qt" ]; then
	if [[ "$CODE_NAME" = "" || "$CODE_NAME" = "macos" || "$CODE_NAME" = "linux" || "$OS_TYPE" = "" ]]; then
		echo "Available Codes :"
		if [ "1" ]; then
			echo "smoke #   produce qt smoke program"
		fi | column -t -s \#
	else
		eval "$OPENGL_SCRIPT_PATH/${CODE_TYPE}_${CODE_NAME}_${OS_TYPE}.sh"
	fi
fi
