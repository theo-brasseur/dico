#!/bin/bash

[[ $# -ne 1 ]] && echo " Usage: lmbuild.sh transcription file name without extension" && exit 1

text2wfreq < $1.transcription | wfreq2vocab > $1.vocab
echo "---------------------------------------------------------------------------"
sed 's/<[^>]\+>//g' $1.transcription | text2idngram -vocab $1.vocab -idngram $1.idngram 
echo "---------------------------------------------------------------------------"
idngram2lm -vocab_type 0 -idngram QA.idngram -vocab QA.vocab -arpa QA.lm
echo "---------------------------------------------------------------------------"
sphinx_lm_convert -i $1.lm -o $1.lm.DMP
