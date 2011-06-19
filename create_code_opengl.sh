#! /bin/sh

if [ "$#" = 0 ]; then
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
		echo "02 #   First Polygon"
		echo "03 #   Adding Color"
		echo "04 #   Rotation"
		echo "05 #   3D Shapes"
		echo "06 #   Texture Mapping"
		echo "07 #   Texture Filters, Lighting & Keyboard Control"
	fi | column -t -s \#
fi

