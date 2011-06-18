template_file=$1

if [[ ! -e "$template_file" &&  "$template_file" != "!" ]]
then
	echo "usage : create_code_v3d_plugin.sh <template file>"
	echo ""
	echo "============ Demo Template File ==========="
	echo "TITLE=\"Test Plugin\""
	echo "PLUGIN_NAME=\"test\""
	echo "PLUGIN_CLASS=\"TestPlugin\""
	echo "PLUGIN_DESCRIPTION=\"This is a test plugin\""
	echo "PLUGIN_DATE=\"2011-06-16\""
	echo "PLUGIN_AUTHOR=\"Hang Xiao\""
	echo "#PLUGIN_GUI=\"test_gui.h\""
	echo "V3D_MAIN_PATH=\"../../work/v3d_external/v3d_main\""

	echo "MENUS=(\"compute average\" \"partial alignment\" \"about\")"
	echo "FUNCS=(\"compute_average\" \"partial_alignment\" \"myabout\")"
	echo ""
	exit 1
elif [ "$template_file" = "!" ]
then
	if [ "1" ]
	then
		echo "TITLE=\"Test Plugin\""
		echo "PLUGIN_NAME=\"test\""
		echo "PLUGIN_CLASS=\"TestPlugin\""
		echo "PLUGIN_DESCRIPTION=\"This is a test plugin\""
		echo "PLUGIN_DATE=\"2011-06-16\""
		echo "PLUGIN_AUTHOR=\"Hang Xiao\""
		echo "#PLUGIN_GUI=\"test_gui.h\""
		echo "V3D_MAIN_PATH=\"../../../v3d_main\""
		echo ""
		echo "MENUS=(\"compute average\" \"partial alignment\" \"about\")"
		echo "FUNCS=(\"compute_average\" \"partial_alignment\" \"myabout\")"
	fi > plugin_template
	echo "plugin_template saved"
	exit 0
fi

while read line
do
	eval $line
done < $template_file

PLUGIN_HEADER="${PLUGIN_NAME}_plugin.h"
PLUGIN_CPP="${PLUGIN_NAME}_plugin.cpp"
FUNC_HEADER="${PLUGIN_NAME}_func.h"
FUNC_CPP="${PLUGIN_NAME}_func.cpp"
PRO_FILE="${PLUGIN_NAME}.pro"

echo "create $PLUGIN_HEADER ..."
if [ "1" ]
then
	echo "/* $PLUGIN_HEADER"
	echo " * $PLUGIN_DESCRIPTION"
	echo " * $PLUGIN_DATE : by $PLUGIN_AUTHOR"
	echo " */"
	echo " "
	echo "#ifndef __`echo ${PLUGIN_NAME} | tr "[:lower:]" "[:upper:]"`_PLUGIN_H__"
	echo "#define __`echo ${PLUGIN_NAME} | tr "[:lower:]" "[:upper:]"`_PLUGIN_H__"
	echo ""
	echo "#include <QtGui>"
	echo "#include <v3d_interface.h>"
	echo ""
	echo "class $PLUGIN_CLASS : public QObject, public V3DPluginInterface2_1"
	echo "{"
	echo -e "\tQ_OBJECT"
	echo -e "\tQ_INTERFACES(V3DPluginInterface2_1);"
	echo ""
	echo "public:"
	echo -e "\tfloat getPluginVersion() const {return 1.1f;}"
	echo ""
	echo -e "\tQStringList menulist() const;"
	echo -e "\tvoid domenu(const QString &menu_name, V3DPluginCallback2 &callback, QWidget *parent);"
	echo ""
	echo -e "\tQStringList funclist() const {return QStringList();}"
	echo -e "\tbool dofunc(const QString &func_name, const V3DPluginArgList &input, V3DPluginArgList &output, V3DPluginCallback2 &callback, QWidget *parent)"
	echo -e "\t{return false;}"
	echo "};"
	echo ""
	echo "#endif"
	echo ""
fi > $PLUGIN_HEADER

echo "create $PLUGIN_CPP ..."
if [ "1" ]
then
	echo "/* $PLUGIN_CPP"
	echo " * $PLUGIN_DESCRIPTION"
	echo " * $PLUGIN_DATE : by $PLUGIN_AUTHOR"
	echo " */"
	echo " "
	echo "#include \"$PLUGIN_HEADER\""
	echo "#include \"$FUNC_HEADER\""
	echo " "
	echo "Q_EXPORT_PLUGIN2($PLUGIN_NAME, $PLUGIN_CLASS);"
	echo " "
	echo "const QString title = QObject::tr(\"$TITLE\");"
	echo "QStringList $PLUGIN_CLASS::menulist() const"
	echo "{"
	echo -ne "\treturn QStringList()"
	i=0
	while [ $i -lt ${#MENUS[@]} ]
	do
		echo -ne "\n\t\t<<tr(\"${MENUS[$i]}\")"
		i=$[i+1]
	done
	echo ";"
	echo "}"
	echo ""
	echo "void $PLUGIN_CLASS::domenu(const QString &menu_name, V3DPluginCallback2 &callback, QWidget *parent)"
	echo "{"
	echo -e "\tif (menu_name == tr(\"${MENUS[0]}\"))"
	echo -e "\t{"
	echo -e "\t\t${FUNCS[0]}(callback,parent);"
	echo -e "\t}"
	i=1
	while [ $i -lt ${#MENUS[@]} ]
	do
		echo -e "\telse if (menu_name == tr(\"${MENUS[$i]}\"))"
		echo -e "\t{"
		echo -e "\t\t${FUNCS[$i]}(callback,parent);"
		echo -e "\t}"
		i=$[i+1]
	done
	echo "}"
	echo ""
fi > $PLUGIN_CPP

echo "create $FUNC_HEADER ..."
if [ "1" ]
then
	echo "/* $FUNC_HEADER"
	echo " * $PLUGIN_DESCRIPTION"
	echo " * $PLUGIN_DATE : by $PLUGIN_AUTHOR"
	echo " */"
	echo " "
	echo "#ifndef __`echo ${PLUGIN_NAME} | tr "[:lower:]" "[:upper:]"`_FUNC_H__"
	echo "#define __`echo ${PLUGIN_NAME} | tr "[:lower:]" "[:upper:]"`_FUNC_H__"
	echo ""
	echo "#include <v3d_interface.h>"
	echo ""
	i=0
	while [ $i -lt ${#FUNCS[@]} ]
	do
		echo "int ${FUNCS[$i]}(V3DPluginCallback2 &callback, QWidget *parent);"
		i=$[i+1]
	done
	echo ""
	echo "#endif"
	echo ""
fi > $FUNC_HEADER

echo "create $FUNC_CPP ..."
if [ "1" ]
then
	echo "/* $FUNC_CPP"
	echo " * $PLUGIN_DESCRIPTION"
	echo " * $PLUGIN_DATE : by $PLUGIN_AUTHOR"
	echo " */"
	echo ""
	echo "#include <v3d_interface.h>"
	echo "#include \"v3d_message.h\""
	echo "#include \"$FUNC_HEADER\""
	if [ ! -z "$PLUGIN_GUI" ]; then echo "#include \"$PLUGIN_GUI\""; fi
	echo ""
	i=0
	while [ $i -lt ${#FUNCS[@]} ]
	do
		echo "int ${FUNCS[$i]}(V3DPluginCallback2 &callback, QWidget *parent)"
		echo "{"
		echo -e "\tv3d_msg(\"${FUNCS[$i]}\");"
		echo -e "\treturn 1;"
		echo "}"
		i=$[i+1]
	done
	echo ""
fi >> $FUNC_CPP

echo "create $PRO_FILE ..."
if [ "1" ]
then
	echo ""
	echo -e "TEMPLATE\t= lib"
	echo -e "CONFIG\t+= qt plugin warn_off"
	echo -e "#CONFIG\t+= x86_64"
	echo -e "INCLUDEPATH\t+= $V3D_MAIN_PATH/basic_c_fun"
	echo ""
	echo -e "HEADERS\t= $PLUGIN_HEADER"
	echo -e "HEADERS\t+= $FUNC_HEADER"
	if [ ! -z "$PLUGIN_GUI" ] ; then echo -e "HEADERS\t+= $PLUGIN_GUI"; fi
	echo ""
	echo -e "SOURCES\t= $PLUGIN_CPP"
	echo -e "SOURCES\t+= $FUNC_CPP"
	echo -e "SOURCES\t+= $V3D_MAIN_PATH/basic_c_fun/v3d_message.cpp"
	echo ""
	echo -e "TARGET\t= \$\$qtLibraryTarget($PLUGIN_NAME)"
	echo -e "DESTDIR\t= ~/Applications/v3d/plugins/$PLUGIN_NAME/"
fi > $PRO_FILE

echo "done"
