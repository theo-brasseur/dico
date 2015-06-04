#!/bin/bash

(( $# != 1 )) && echo "Usage: genfileid.sh \"nom\"" && exit 1

adp=$(find $HOME -name "adp" | head -n 1)

if [ -z $adp ]; then
	echo -e "Aucun dossier adp deja existant.\nRecherche de fichier audio dans le repertoire courant."
	adp=$PWD
fi

fidsfile=$adp/$1.fileids
transfile=$adp/QA.transcription


if [ ! -e $fidsfile ] || [ ! -e $tranfile ] 
then  
	echo "fileids ou QA.transcription non existant pour $1" 
   	exit 1
fi

sed '/^\s*$/d' $transfile > tmp

rm $adp/$1.transcription 2> /dev/null

i=1
while read transline
do
	fidsline=$(sed "$i q;d" $fidsfile)
	echo "${transline}" | sed "s/\(.*[^\r]\)/\1 ($fidsline)/" >> $adp/$1.transcription
	i=$((i+1))
done < tmp


rm tmp

if [ -s $adp/$1.transcription ] 
then 
	echo "Le fichier $1.transcription a ete ecrit dans $adp"; 
else
	echo "Erreur le fichier $1.transcription est vide"
fi
