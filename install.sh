#!/bin/bash
for dir in *; do
	if [ -d "$dir" ]; then
		cd $dir
		for file in .[^.]*; do
			ln -s $PWD/$file ~/$file
		done
		cd ../
	fi
done
