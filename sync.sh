dir=ffmpeg
rm -rf $dir
#------------------
#get latest codes
#------------------
git clone git://source.ffmpeg.org/ffmpeg.git $dir

./build.sh $dir
