echo "Are you sure you want to do a no comment commit?"
echo "Only do this in junk repos. Is this a junk repo?!"
echo "Press ENTER to proceed with this commit." 
read ENTERINPUT 

git commit -a -m "No commit message."

if [ -z $1 ]; then echo "Not pushing, no arg passed."; else git push;  fi


