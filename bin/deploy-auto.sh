#!/bin/bash
help(){
   cat << EOF
You can find the best way to complieted this function!
     $0 -r|-R listfile 
          cp file listed in listfile from git director into HOME
     $0 -b|-B listfile
          update file from HOME director into git only listed in listfile
EOF
}



if [ $# = 0 ]; 
then
	help
	exit
fi

while read line
do
	name=$(echo $line |awk '{print $1}');	
	
	if [[ "$name" != \#* ]]
	then 
		path1=$(echo $line |awk '{print $2}');
		path2=$(echo $line |awk '{print $3}');

		if [[ $path1 || $path2 ]]
		then 
			if [ -f $path1 ]
			then
				mv $path1 $path1.bak
				echo "** "$path1 " has backup! see " $path1.bak "**"
			fi

			case $1 in
				-r|-R)
					echo "Restore from Git " $name " OK!"
					#cd $HOME
					cp -rf $HOME/$path2 $HOME/$path1
					;;
				-b|-B)
					echo "Back File into Git Dir" $name " OK!"
					#cd $HOME
					cp -rf $HOME/$path1 $HOME/$path2
					;;
				-i|-I)
					echo Install Archlinux package!
					echo Install commo Program!
					pacman -Syu
					pacman -S ibus-googlepinyin vim emacs goagent chromium
					exit
					;;
				*)
					help
					;;
			esac
		
		fi
		

    fi
done <$2;

echo Done! Enjoy Your Life!
