#! /bin/sh
if [ "$#" = "0" ]
then 
	echo "usage: create_dialog.sh <DialogFile>"
	echo ""
	echo "============ EXAMPLE : DialogTemplate  =============="
	echo "CLASS TestDialog"
	echo ""
	echo "D QLabel label_subject \"Subject Image :\""
	echo "D QComboBox combo_subject "
	echo ""
	echo "D QLabel label_target \"Target Image :\""
	echo "D QComboBox combo_target "
	echo ""
	echo "D QLabel label_sub_channel \"Subject Channel :\""
	echo "D QLabel label_tar_channel \"Target Channel :\""
	echo ""
	echo "D QSpinBox channel_sub"
	echo "D QSpinBox channel_tar"
	echo ""
	echo "D QPushButton ok \"ok\""
	echo "D QPushButton cancel \"cancel\""
	echo ""
	echo "D QGridLayout gridLayout"
	echo ""
	echo "L 0 0 label_subject"
	echo "L 0 1 combo_subject 1 5"
	echo "L 1 0 label_sub_channel"
	echo "L 1 1 channel_sub 1 1"
	echo "L 2 0 label_target"
	echo "L 2 1 combo_target 1 5"
	echo "L 3 0 label_tar_channel"
	echo "L 3 1 channel_tar"
	echo "L 5 4 cancel Qt::AlignRight"
	echo "L 5 5 ok     Qt::AlignRight"
	echo ""
	echo "C ok clicked() this accept()"
	echo "C cancel clicked() this reject()"
	echo ""
	echo "C combo_subject currentIndexChanged(int) this update()"
	echo "C combo_target currentIndexChanged(int) this update()"
	echo ""
	echo "C channel_sub valueChanged(int) this update()"
	echo "C channel_tar valueChanged(int) this update()"
	exit 1
elif [ "$1" = "!" ]
then
	if [ "1" ]
	then
		echo "CLASS TestDialog"
		echo ""
		echo "D QLabel label_subject \"Subject Image :\""
		echo "D QComboBox combo_subject "
		echo ""
		echo "D QLabel label_target \"Target Image :\""
		echo "D QComboBox combo_target "
		echo ""
		echo "D QLabel label_sub_channel \"Subject Channel :\""
		echo "D QLabel label_tar_channel \"Target Channel :\""
		echo ""
		echo "D QSpinBox channel_sub"
		echo "D QSpinBox channel_tar"
		echo ""
		echo "D QPushButton ok \"ok\""
		echo "D QPushButton cancel \"cancel\""
		echo ""
		echo "D QGridLayout gridLayout"
		echo ""
		echo "L 0 0 label_subject"
		echo "L 0 1 combo_subject 1 5"
		echo "L 1 0 label_sub_channel"
		echo "L 1 1 channel_sub 1 1"
		echo "L 2 0 label_target"
		echo "L 2 1 combo_target 1 5"
		echo "L 3 0 label_tar_channel"
		echo "L 3 1 channel_tar"
		echo "L 5 4 cancel Qt::AlignRight"
		echo "L 5 5 ok     Qt::AlignRight"
		echo ""
		echo "C ok clicked() this accept()"
		echo "C cancel clicked() this reject()"
		echo ""
		echo "C combo_subject currentIndexChanged(int) this update()"
		echo "C combo_target currentIndexChanged(int) this update()"
		echo ""
		echo "C channel_sub valueChanged(int) this update()"
		echo "C channel_tar valueChanged(int) this update()"
	fi > dialog_template
	echo "dialog_template saved"
	exit 0
fi

DIALOG_TEMPLATE=$1

CLASS_NAME=""
LAYOUT=""
STAT=""
DEFINITIONS=""
UPDATE_DEFS=""
UPDATE_CODES=""

echo "#ifndef __`echo $DIALOG_TEMPLATE | tr [:lower:] [:upper:] `_H__"
echo "#define __`echo $DIALOG_TEMPLATE | tr [:lower:] [:upper:] `_H__"
echo ""
echo "#include <QtGui>"
echo "#include <v3d_interface.h>"
echo ""

while read line
do
	if [ "$line" = "" ]
	then
		echo ""
		if [ "$STAT" = "D" ]
		then
			DEFINITIONS="${DEFINITIONS}\n"
		elif [ "$STAT" = "U" ]
		then
			UPDATE_DEFS="${UPDATE_DEFS}\n"
			UPDATE_CODES="${UPDATE_CODES}\n"
		fi
		continue
	fi

	TYPE=`echo $line | awk '{print $1}'`
	if [ "$TYPE" = "CLASS" ]
	then
		if [ "$CLASS_NAME" = "" ]
		then
			CLASS_NAME=`echo $line | awk '{print $2}'`
			echo "class $CLASS_NAME : public QDialog"
			echo "{"
			echo -e "\tQ_OBJECT"
			echo ""
			echo "public:"
			echo -e "\t$CLASS_NAME(V3DPluginCallback &callback, QWidget * parent)"
			echo -e "\t{"
			echo -e "\t\tv3dhandleList win_list = callback.getImageWindowList();"
			echo -e "\t\tQStringList items;"
			echo -e "\t\tfor(int i = 0; i < win_list.size(); i++) items << callback.getImageName(win_list[i]);"
		else
			echo -e "\t}"
			echo ""
			echo -e "\t~$CLASS_NAME(){}"
			echo ""
			echo "public slots:"
			echo -e "\tvoid update()"
			echo -e "\t{"
			echo -e "$UPDATE_CODES"
			echo -e "\t}"
			echo ""
			echo "public:"
			echo -ne "$UPDATE_DEFS"
			echo -ne "$DEFINITIONS"
			echo "};"
			echo ""
			echo ""

			CLASS_NAME=`echo $line | awk '{print $2}'`
			LAYOUT=""
			DEFINITIONS=""
			UPDATE_DEFS=""
			UPDATE_CODES=""
			STAT=""
			echo "class $CLASS_NAME : public QDialog"
			echo "{"
			echo -e "\tQ_OBJECT"
			echo ""
			echo "public:"
			echo -e "\t$CLASS_NAME(V3DPluginCallback &callback, QWidget * parent)"
			echo -e "\t{"
			echo -e "\t\tv3dhandleList win_list = callback.getImageWindowList();"
			echo -e "\t\tQStringList items;"
			echo -e "\t\tfor(int i = 0; i < win_list.size(); i++) items << callback.getImageName(win_list[i]);"
		fi
	elif [ "$TYPE" = "D" ]
	then
		if [ "$STAT" != "D" ]
		then
			STAT="D"
		fi
		DEF=`echo $line | awk -F\| '{print $1}'`
		BUTTON_TYPE=`echo $DEF | awk '{print $2}'`
		BUTTON_NAME=`echo $DEF | awk '{print $3}'`
		PARAMETER=`echo $DEF | awk -F\" '{print $2}'`
		COMMANDS=`echo $line | awk -F\| '{print $2}'`
		if [ -z "$PARAMETER" ]
		then
			echo -e "\t\t$BUTTON_NAME = new $BUTTON_TYPE();"
		else
			echo -e "\t\t$BUTTON_NAME = new $BUTTON_TYPE(tr(\"$PARAMETER\"));"
		fi
		for cmd in $COMMANDS
		do
			echo -e "\t\t$BUTTON_NAME->$cmd;"
		done
		if [ "$BUTTON_TYPE" = "QGridLayout" ]
		then
			LAYOUT=$BUTTON_NAME
		fi
		DEFINITIONS="${DEFINITIONS}\t$BUTTON_TYPE * $BUTTON_NAME;\n"
	elif [ "$TYPE" = "L" ]
	then
		if [ "$STAT" != "L" ]
		then
			STAT="L"
		fi
		ROW=`echo $line | awk '{print $2}'`
		COL=`echo $line | awk '{print $3}'`
		OBJ=`echo $line | awk '{print $4}'`
		WID=`echo $line | awk '{print $5}'`
		HIG=`echo $line | awk '{print $6}'`
		PAR=`echo $line | awk '{print $5}'`

		if [ "$HIG" != "" ]
		then
			echo -e "\t\t$LAYOUT->addWidget($OBJ, $ROW, $COL, $WID, $HIG);"
		elif [ "$PAR" != "" ]
		then
			echo -e "\t\t$LAYOUT->addWidget($OBJ, $ROW, $COL, $PAR);"
		else
			echo -e "\t\t$LAYOUT->addWidget($OBJ, $ROW, $COL);"
		fi
	elif [ "$TYPE" = "C" ]
	then
		if [ "$STAT" = "L" ]
		then
			echo -e "\t\tsetLayout($LAYOUT);"
			STAT="C"
		fi
		SIG_NAM=`echo $line | awk '{print $2}'`
		SIG_ACT=`echo $line | awk '{print $3}'`
		SLT_NAM=`echo $line | awk '{print $4}'`
		SLT_ACT=`echo $line | awk '{print $5}'`
		echo -e "\t\tconnect($SIG_NAM, SIGNAL($SIG_ACT), $SLT_NAM, SLOT($SLT_ACT));"
	elif [ "$TYPE" = "U" ]
	then
		VAR_TYPE=`echo $line | awk '{print $2}'`
		VAR_NAME=`echo $line | awk '{print $3}'`
		VAR_VALUE=`echo $line | awk -F\| '{print $2}'`
		UPDATE_DEFS="${UPDATE_DEFS}\t$VAR_TYPE $VAR_NAME;\n"
		UPDATE_CODES="${UPDATE_CODES}\t\t$VAR_NAME = $VAR_VALUE;\n"
	fi
done < $DIALOG_TEMPLATE

echo -e "\t}"
echo ""
echo -e "\t~$CLASS_NAME(){}"
echo ""
echo "public slots:"
echo -e "\tvoid update()"
echo -e "\t{"
echo -e "$UPDATE_CODES"
echo -e "\t}"
echo ""
echo "public:"
echo -ne "$UPDATE_DEFS"
echo -ne "$DEFINITIONS"
echo "};"
echo ""

echo "#endif"
