#!/bin/bash

INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$
vi_editor=${EDITOR-vi}
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM


function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "Linux Shell Script Tutorial" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

search()
{
s=$1  
 
#find -user $1 -type f -a -x >$OUTPUT
find -user $1 -executable -type f >$OUTPUT
display_output 60 60 "detail"

	

}
search_zied()
{
#echo "Saisir le nom del'utilisateur"
#read nomutilisateur
s=$1
find / -user $1 -executable -type f 2>&1 | grep -v "Permission non accordée"  2>&1 | grep -v "Aucun" >$OUTPUT
display_output 100 60 "detail"
}
remove_zied()
{
#echo "Saisir le nom del'utilisateur" >$OUTPUT
#read nomutilisateur
#display_output 100 60 "remove"
find  /home/nawres/test2/ -user $1 -executable -type f  -exec rm -f {} \; >$OUTPUT
echo " La suppression est effectue avec succes" >$OUTPUT
display_output 100 60 "remove"


}


detail()
{
s=$1
#find -user $s -type f -ls >$OUTPUT
find -user $1 -executable -type f -ls >$OUTPUT
display_output 60 60 "detail"
}


pourcentage()
{
Date=$(date +%d-%m-%Y)
#rx=$(find -type f | wc -l)
#rt=$(find | wc -l)

#rx=$(find -executable  -type f | wc -l)
rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l )
p=$((100*$rx/$rt))
 
echo "$Date $p%" >$OUTPUT
display_output 10 60 "Pourcentage"



}
pourcentage_2()
{
Date=$(date +%d-%m-%Y)
#rx=$(find -type f | wc -l)
#rt=$(find | wc -l)

rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l)
p=$((100*$rx/$rt))

 
 


}

save()
{
pourcentage_2
echo "$Date $p%" >> test.txt 
echo "$Date $p% est enregistrée">$OUTPUT
display_output 10 60 "Pourcentage"


}
