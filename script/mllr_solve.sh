#!/bin/bash

hmm=$(dirname $(find $HOME -name feat.params | grep fr))
accumdir=$(find $HOME -name accumdir)

[[ -z accumdir ]] && accumdir=$PWD
[[ -z $hmm ]] && echo mllr_matrix repertoire hmm pas trouve && exit 1

/usr/local/libexec/sphinxtrain/mllr_solve \
	-meanfn $hmm/means \
	-varfn $hmm/variances \
	-outmllrfn mllr_matrix \
	-accumdir $accumdir 
