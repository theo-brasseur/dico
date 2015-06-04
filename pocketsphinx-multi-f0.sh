#!/bin/bash

#	Reconnaissance vocale avec PocketSphinx - Fichiers multiples
#
#	HMM : french_f0	
#	Dictionnaire : frenchWords62K.dic
#	LM : french3g62K.lm.dmp
#
#	Usage : ./pocketpshinx-multi-f0.sh dossier/
#	Le "/" final est très important !
#
#	Le fichier son doit être un fichier au format WAV 16 bit mono
#	échantillonné à 16000 Hz.

REP="$1"
NAME=`echo $REP | cut -d "/" -f3`
DICT="/usr/local/share/pocketsphinx/model/fr-fr/frenchWords62K.dic"
HMM="/usr/local/share/pocketsphinx/model/hmm/fr_FR/french_f0"
LM="/usr/local/share/pocketsphinx/model/lm/fr_FR/french3g62K.lm.dmp"
HYP="resultats-$NAME.hyp"
REPORT="rapport-$NAME.log"
HEURE=$(date +%Hh%M)
JOUR=$(date +%d/%m/%Y)

echo "########################################################################" >> $REPORT
echo "#\t\tExécution du $JOUR à $HEURE - Rapport\t\t #" >> $REPORT
echo "########################################################################" >> $REPORT

ls $REP*.wav > liste-audio-$NAME.txt

while read line
	do
		pocketsphinx_continuous \
		-dict $DICT \
		-hmm $HMM \
		-lm $LM \
		-hyp $HYP \
		-infile $line 2>> $REPORT
	done < liste-audio-$NAME.txt
