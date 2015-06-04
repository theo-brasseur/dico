#!/bin/bash

part=1
i=1
while [[ $i -lt 100000 ]]
do
	echo eriture dans adp.dict${part}.txt
	sed -n $i,$(($i+1999))p model/lm/fr_FR/adp.dict > adp.dict${part}.txt
	i=$(( ${i} + 2000))
	part=$(( ${part} + 1 ))
done

sed -n $i,105003p model/lm/fr_FR/adp.dict >> adp.dict50.txt

