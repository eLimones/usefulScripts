#!/bin/sh
if [ $# -eq 0 ]
then
	echo "No arguments"
	ORG_NAME=STM32F0Examples
else
	echo "Arguments: $1"
	ORG_NAME=$1
fi

curl https://api.github.com/orgs/$ORG_NAME/repos > repos
for repName in  $(cat repos |  grep "clone_url");do 
	[ $repName != '"clone_url":' ] && echo $repName ; 
done
rm -f repos
