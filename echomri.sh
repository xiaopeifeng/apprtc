errorstatic="./obj.host/"
echo "create libaz.a" >> libaz.mri

echo $errorstatic

array=($(find ./ -name "*.a"))

for i in "${array[@]}"
do
	if [ "${i/$errorstatic}" = "$i" ]; then
		echo "addlib $i" >> libaz.mri
	else
		echo "do not deal with this static library"
	fi
done

echo "save" >> libaz.mri
echo "end" >> libaz.mri



