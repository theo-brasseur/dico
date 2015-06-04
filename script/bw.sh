#!/bin/bash

[[ $# -ne 1 ]] && echo "Usage: bw.sh \"nom\"" && exit 1

hmm=$(dirname $(find $HOME -name "feat.params" | grep fr | head -n 1))
lm=$(find $HOME -name "*.lm*" | grep fr_FR | head -n 1)
dict=$(find $HOME -name "*.dict" | grep fr | head -n 1)
fileids=$(find $HOME -name $1.fileids | head -n 1)
transcription=$(find $HOME -name $1.transcription | head -n 1)

if [ -z $hmm ] || [ -z $lm ] || [ -z $dict ] || [ -z $transcription ]
then
	echo "Certains repertoire n ont pas ete trouve" && exit 1
fi

mkdir $PWD/accumdir 2> /dev/null
accumdir=./accumdir

/usr/local/libexec/sphinxtrain/bw \
	-hmmdir $hmm \
	-moddeffn $hmm/mdef \
	-ts2cbfn .cont. \
	-feat 1s_c_d_dd \
	-mixwfn $hmm/mixture_weights \
	-cmn current \
	-agc none \
	-dictfn $dict \
	-ctlfn $fileids \
	-accumdir $accumdir \
	-lsnfn $transcription 
	
(( $? == 0 ))  && echo "Les fichiers résultats de bw se trouvent dans $(basename $accumdir)"

