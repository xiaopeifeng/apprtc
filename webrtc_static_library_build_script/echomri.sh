# this shell script is used to build a static library for webrtc.
# because I never found a way to build a static library for webrtc,
# so I try to make a script for it and share it with you.
# if any problems, contact with me at xiaopeifenng@hotmail.com

# usage:
# you should firstly put this shell script in the directory of 
# "webrtc/src/out/Debug" or "webrtc/src/out/Release", and execute it
# execute the command "ar -M < libjingle_peerconnection_static.mri"
# after that, you will found a libjingle_peerconnection.a in the folder.


errorstatic="./obj.host/"
echo "create libjingle_peerconnection.a" >> libjingle_peerconnection_static.mri

echo $errorstatic

array=($(find ./ -name "*.a"))

for i in "${array[@]}"
do
	if [ "${i/$errorstatic}" = "$i" ]; then
		echo "addlib $i" >> libjingle_peerconnection_static.mri
	else
		echo "do not deal with this static library"
	fi
done

echo "save" >> libjingle_peerconnection_static.mri
echo "end" >> libjingle_peerconnection_static.mri

echo "generate mri sucess"
