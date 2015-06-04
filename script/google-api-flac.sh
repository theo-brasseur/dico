#!/bin/bash

#	Reconnaissance vocale avec l'API Google
#
#	Usage : ./google-api-flac.sh fichier.flac
#
#	Le fichier son doit être un fichier au format FLAC échantillonné
#	à 16000 Hz

FLAC="$1"

curl -X POST --data-binary @$FLAC --header 'Content-Type: audio/x-flac; rate=16000;' 'https://www.google.com/speech-api/v2/recognize?client=chromium&lang=fr-FR&maxresults=1&key=AIzaSyALomzA4SXamn7xNYP6uNwDXJJlg0l2RQI'
