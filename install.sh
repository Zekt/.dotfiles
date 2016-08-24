#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Please specify the dotfiles you want to install, or pass 'all' to install all."
	exit
fi
if [ $1 = 'all' ]; then
	echo "You're gonna put following dotfiles symbolic links in your home directory:"
	for dir in *; do
		if [ -d "$dir" ]; then
			echo "$dir"
		fi
	done
	while true; do
		read -p "Do yout want to continue[Yes/No]?" yn
		case $yn in
			[Yy]* )
				for dir in *; do
					createStruct $dir
					if [ -d "$dir" ]; then
						cd $dir
						for file in .[^.]*; do
							ln -s $PWD/$file $HOME/$file
						done
						cd ..
					fi
				done
				break;;
			[Nn]* )
				exit;;
			* ) 
				echo "Please input Yes/No.";;
		esac
	done
else
	for dir in $@; do
		if ! [ -d $dir ]; then
			echo "Dotfiles directory '$dir' doesn't exist!"
			exit
		fi
	done
	echo "You're gonna put following dotfiles symbolic links in your home directory:"
	for dir in $@; do
		echo "$dir"
	done
	while true; do
		read -p "Do yout want to continue[Yes/No]?" yn
		case $yn in
			[Yy]* )
				for dir in $@; do
					if [ -d $dir ]; then
						cd $dir
						for file in .[^.]*; do
							if [ -L ~/$file ]; then
								if [ $replace = true ]; then
									unlink $HOME/$file
								elif [ $skip = true ]; then
									continue
								else
									read -p "Symlink $file already exist, replace[Yes/No/Replace all/Skip all]?" yn
									case $yn in
										[Yy]* ) unlink ~/$file;;
										[Nn]* ) continue;;
										[Aa]* ) replace=true; unlink ~/$file;;
										[Ss]* ) skip=true;;
									esac
								fi
							fi
							ln -s $PWD/$file $HOME/$file
						done
						cd ..
					else
						echo "$dir doesn't exist!"
					fi
				done
				break;;
			[Nn]* )
				exit;;
			* ) 
				echo "Please input Yes/No.";;
		esac
	done
fi

function createStruct {
	for entry in $1/*; do
		if [ -d $entry ]; then
			relpath+=/$entry
			if ! [ -d $HOME$relpath ]; then
				mkdir $HOME$relpath
			fi
			cd $1
			createStruct $entry
		else
			ln -s $PWD/$entry $HOME$relpath/$entry
		fi
	done
}
