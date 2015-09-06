#!/bin/sh
if [ $# -eq 0 ]
then
	echo "No arguments"
	ORG_NAME=STM32F0Examples
else
	echo "Downloading repos from: $1"
	ORG_NAME=$1
fi

repo_urls=$( curl https://api.github.com/orgs/$ORG_NAME/repos | grep "clone_url"  | grep -Eo  "https:.+\\.git" )

for repo in $repo_urls; do
	git clone $repo
done

