#!/bin/bash

(( $# != 1 )) && echo "Usage: genfileid.sh \"nom\"" && exit 1

adp=$(find $HOME -name "adp" | head -n 1)

if [ -z $adp ]; then
	echo -e "Aucun dossier adp deja existant.\nRecherche de fichier audio dans le repertoire courant."
	adp=$PWD
fi

rm $adp/$1.fileids 2> /dev/null

for i in $(find $adp -name "$1*.wav" | sort -n)
do
	echo $(basename $i) | cut -d '.' -f 1 >> $adp/$1.fileids
done

if [ -s $adp/$1.fileids ] 
then 
	echo "Le fichier $1.fileids a ete ecrit dans $adp"; 
else 
	echo "Aucun fichier contenant la chaine $1*.wav trouve"
fi
