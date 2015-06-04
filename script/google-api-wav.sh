#!/bin/bash

#	Reconnaissance vocale avec l'API Google
#
#	Usage : ./google-api-wav.sh fichier.wav
#
#	Le fichier son doit être un fichier au format wav échantillonné
#	à 16000 Hz

WAV="$1"

curl -X POST --data-binary @$WAV --header 'Content-Type: audio/l16; rate=16000;' 'https://www.google.com/speech-api/v2/recognize?client=chromium&lang=fr-FR&maxresults=1&key=AIzaSyALomzA4SXamn7xNYP6uNwDXJJlg0l2RQI'
