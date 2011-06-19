#! /bin/sh

if [ "$#" = "0" ]; then
	echo "usage : create_code_shell_script.sh <code name>"
	echo "use ! to display detailed information"
	exit 0;
fi

if [ "$1" = "!" ]; then
	echo "Available Codes : dayofweek"
	echo ""
	if [ "1" ]; then
		echo "dayofweek #   get the day of week with the date format yyyymmdd or ! for current day"
	fi | column -t -s \#
	exit 0
fi

CODE_NAME=$1
if [ "$CODE_NAME" = "" ]
then :
elif [ "$CODE_NAME" = "dayofweek" ]; then
	echo "create dayofweek.sh ..."
	if [ "1" ] ; then 
		echo '#!/bin/sh'
		echo ''
		echo '# SAVE THIS CODE AS dayofweek.sh'
		echo '#'
		echo '# Uses Zellers Congruence calculation to use a date and give'
		echo '# the day of the week that date was.'
		echo '#'
		echo '# This function expects 1 Arguments,'
		echo '# YYYYMMDD'
		echo '# example:20090520'
		echo '# then'
		echo '# Returns a value between 0 and 6 to represent the day of the'
		echo '# week where 0=Sun,1=Mon,...6=Sat'
		echo '#'
		echo '# e.g dayofweek.sh 20090520'
		echo '#'
		echo '# This formula is Year 2000 compliant.'
		echo '# It is not compliant using dates previous to Oct 1752'
		echo ''
		echo 'if [ "$#" = "0" ]; then'
		echo '	echo "usage : dayofweek.sh yyymmdd"'
		echo '	echo "Example \"dayofweek.sh 20110619\""'
		echo '	echo "run \"dayofweek.sh !\" to get the week of today."'
		echo '	exit 0'
		echo 'fi'
		echo ''
		echo 'if [ "$1" = "!" ]; then'
		echo '	YMD=`date +20%y%m%d`'
		echo '	echo "Today is $YMD"'
		echo 'else'
		echo '	YMD=$1'
		echo 'fi'
		echo '#'
		echo '#YMD=$1'
		echo 'YEAR=`echo $YMD|cut -c1-4`'
		echo 'MONTH=`echo $YMD|cut -c5-6`'
		echo 'DAY=`echo $YMD|cut -c7-9`'
		echo ''
		echo '# Adjust Month such that March becomes 1 month of'
		echo '# year and Jan/Feb become 11/12 of previous year'
		echo '# ============================================='
		echo ''
		echo 'if [ $MONTH -ge 3 ]'
		echo 'then'
		echo '  MONTH=$[MONTH - 2]'
		echo 'else'
		echo '  MONTH=$[MONTH + 10]'
		echo 'fi'
		echo ''
		echo ''
		echo 'if [ $MONTH -eq 11 ] || [ $MONTH -eq 12 ] ; then'
		echo '  YEAR=$[YEAR - 1]'
		echo 'fi'
		echo '# =============================================='
		echo ''
		echo '# Split YEAR into YEAR and CENTURY'
		echo '# ================================'
		echo 'CENTURY=$[YEAR / 100]'
		echo 'YEAR=$[YEAR % 100]'
		echo '# ================================'
		echo ''
		echo '# Black Magic Time'
		echo '# ================'
		echo '#Z=(( 26*$MONTH - 2 ) / 10) + $DAY + $YEAR + ( $YEAR/4 ) + ( $CENTURY/4 ) - (2 * $CENTURY) + 77) % 7'
		echo 'Z=`expr \( $MONTH \* 26 - 2 \) / 10`'
		echo 'Z=`expr $Z + $DAY + $YEAR`'
		echo 'Z=`expr $Z + $YEAR / 4`'
		echo 'Z=`expr $Z + $CENTURY / 4`'
		echo 'Z=`expr $Z - $CENTURY - $CENTURY + 77`'
		echo 'Z=`expr $Z % 7`'
		echo 'if [ $Z -lt 0 ] ; then'
		echo '  Z=`expr $Z + 7`'
		echo 'fi'
		echo '# ================'
		echo ''
		echo 'if [ "$Z" = "0" ]; then'
		echo '	echo "Sun"'
		echo 'elif [ "$Z" = "1" ]; then'
		echo '	echo "Mon"'
		echo 'elif [ "$Z" = "2" ]; then'
		echo '	echo "Tue"'
		echo 'elif [ "$Z" = "3" ]; then'
		echo '	echo "Wed"'
		echo 'elif [ "$Z" = "4" ]; then'
		echo '	echo "Thu"'
		echo 'elif [ "$Z" = "5" ]; then'
		echo '	echo "Fri"'
		echo 'elif [ "$Z" = "6" ]; then'
		echo '	echo "Sat"'
		echo 'fi'
		echo '# Sun 0'
		echo '# Mon 1'
		echo '# Tue 2'
		echo '# Wed 3'
		echo '# Thu 4'
		echo '# Fri 5'
		echo '# Sat 6'
		echo '# ========================'
	fi > dayofweek.sh
	chmod +x dayofweek.sh
fi
