#!/bin/bash


[[  $# -ne 1 ]] && echo "Usage: sphinx_fe.sh \"NomSansExtension\"" && exit 1

hmm=$(dirname $(find $HOME -name feat.params | grep fr | head -n 1))
adp=$(find $HOME -name adp -type d | head -n 1)

[[ -z $adp ]] && adp=$PWD

fileids=$adp/$1.fileids
audiodir=$(dirname $(find $adp -name $1*.wav -type f) | uniq ) 

if [ -z $hmm ] || [ -z $adp ] || [ -z $fileids ] || [ -z $audiodir ]
then
	echo "Certains repertoire n ont pas ete trouve" && exit 1
fi
 
sphinx_fe -argfile $hmm/feat.params \
	-samprate 16000 -c $fileids \
	-di $audiodir -do . -ei wav -eo mfc -mswav yes
