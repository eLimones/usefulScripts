#! /usr/bin/sh
oldname=$1
newname=$2

for filename in $(ls $oldname* ); do
	postfix=$(echo $filename | grep -o "\.\w*")
	mv -v $oldname$postfix $newname$postfix
done
