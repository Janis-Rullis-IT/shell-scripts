#!/bin/bash

PARTS=`tr '/' '\n' <<< $PWD;`

for PART in $PARTS; do
	echo $PART
done