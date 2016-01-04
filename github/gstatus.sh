#Update the all the git repositories in the files specified by $1
for iDIR in $(ls -d */);do
	cd  $iDIR
    if [ $(git status --short | wc -l ) != 0 ];then
       pwd;
       git status --short;
    #else
    #   echo $PWD updated
    fi
	cd ..
done       
