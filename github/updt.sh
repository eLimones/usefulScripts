#Update the all the git repositories in the files specified by $1
SPL=$(ls -d $1 )
for iDIR in $SPL
do
	cd  $iDIR
	echo $(pwd)
	git pull origin master
	cd ..
done       