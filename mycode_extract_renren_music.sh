if [ "$#" = "0" ]; then
echo "usage : ./extract_renren_music.sh <email> <password> [<music_name>]"
echo "usage : ./extract_renren_music.sh -f <login_file> [<music_name>]"
echo "echo \"email=xxx&password=xxx\" > login_file"
exit 0
fi
if [ "$1" != "-f" ]; then
wget --save-cookies cookies.txt --keep-session-cookies  --post-data "email=$1&password=$2" -O home -o log "http://www.renren.com/PLogin.do"
else
wget --save-cookies cookies.txt --keep-session-cookies  --post-data "`cat $2`" -O home -o log "http://www.renren.com/PLogin.do"
fi
echo "Login renren successfully!"
if [ "$3" = "" ]; then
	echo "get renren  musicbox ..."
	wget --load-cookies cookies.txt --save-cookies cookies.txt --keep-session-cookies -O musicbox -o log "http://music.renren.com/musicbox"
	echo "extract mp3 url ..."
	grep "*.mp3" musicbox
	mp3_src=`grep -o 'http:.*\.mp3' musicbox`
	if [ "$mp3_src" != "" ];
	then
		wget --load-cookies cookies.txt --save-cookies cookies.txt --keep-session-cookies $mp3_src
	else
		echo "No music link is found!"
	fi
else
	#echo "specific music download is under construction!"
	#echo "try to get songId and download musicbox music.renren.com/musicbox?tab=1&autoPlay=true&songId=xxxxx"
	wget --load-cookies cookies.txt --save-cookies cookies.txt --keep-session-cookies "music.renren.com/musicbox?tab=1&autoPlay=true&songId=$3"
fi
