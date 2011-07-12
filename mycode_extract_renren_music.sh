if [ "$#" = "2" ]; then
wget --save-cookies cookies.txt --keep-session-cookies  --post-data "email=$1&password=$2" -O home "http://www.renren.com/PLogin.do"
elif [ "$#" = "1" ]; then
wget --save-cookies cookies.txt --keep-session-cookies  --post-data "`cat $1`" -O home "http://www.renren.com/PLogin.do"
else
echo "usage : ./extract_renren_music.sh <email> <password>"
echo "usage : ./extract_renren_music.sh <login_file>"
echo "cat email=xxx&password=xxx > login_file"
exit 0
fi
wget --load-cookies cookies.txt --save-cookies cookies.txt --keep-session-cookies -O musicbox "http://music.renren.com/musicbox"
grep "*.mp3" musicbox
mp3_src=`grep -o 'http:.*\.mp3' musicbox`
wget --load-cookies cookies.txt --save-cookies cookies.txt --keep-session-cookies $mp3_src
