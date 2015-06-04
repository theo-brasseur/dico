#!/bin/bash

#	Reconnaissance vocale avec PocketSphinx - Utilisation alternative
#
#	hmm : french_f2	
#	Dict : frenchWords62K.dic
#	lm : french3g62K.lm.dmp
#
#	Usage : ./pocketpshinx-default.sh fichier.wav
#
#	Le fichier son doit être un fichier au format WAV 16 bit mono
#	échantillonné à 16000 Hz.

dict=$(find $HOME -name "*.dict" | grep fr )
hmm=$(dirname $(find $HOME -name "feat.params" | grep fr))
lm=$(find $HOME -name "*.lm*" | grep fr)
WAV="$1"

HEURE=$(date +%Hh%M)
JOUR=$(date +%d/%m/%Y)

echo "########################################################################" >> report.log
echo "#\t\tExécution du $JOUR à $HEURE - Rapport\t\t #" >> report.log
echo "########################################################################" >> report.log

pocketsphinx_continuous -dict $dict -hmm $hmm -lm $lm -infile $WAV \
	2>> report.log
