#!/bin/bash

find . -name "*.pdf" | while read file
do
	echo $file | cut -f2 -d'/'
done
