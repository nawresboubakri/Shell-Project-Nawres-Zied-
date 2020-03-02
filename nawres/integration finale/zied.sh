#! /bin/sh


menu()
{
yad --title=$TITBOX --text="veuillez entrer votre choix" \
     --window-icon="gnome" --image="gnome" --image-on-top \
    --list --radiolist --no-headers \
    --button=gtk-no:1 --button=gtk-yes:0 \
    --column 1 --column 2  --print-column=2 \
     true "search" false "search-rm" false "detail" \
     false "pourcentage" false "Save"  false "help"  false "Quitter"
}

detail()
{
action=$(yad --title="detail" --width=200 --heigth=50 --entry )
test1=$(find -user $action  -executable -type f -ls)
 
yad --title="detail" --info --text=" $test1 "

}





pourcentage()
{

test2=$(Date=$(date +%d-%m-%Y)
#rx=$(find -type f | wc -l)
#rt=$(find | wc -l)

rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l)
p=$((100*$rx/$rt))
 
echo "$Date $p%" )
yad --title="pourcentage" --info --text=" $test2 "



}

search()
{

action=$(yad --title="search" --width=200 --heigth=50 --entry )
test=$(find / -user $action -executable -type f 2>&1 | grep -v "Permission non accordée"  2>&1 | grep -v "Aucun")

yad --title="search" --info --text=" $test "
}


search_rm()
{

action=$(yad --title="search-rm" --width=200 --heigth=50 --entry )
test=$(find  /home/nawres/test/ -user $action -executable -type f  -exec rm -f {} \;)
yad --title="search-rm" --info --text=" $test "

}
pourcentage_2()
{
Date=$(date +%d-%m-%Y)


rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l)
p=$((100*$rx/$rt))

 
 


}

save()
{
pourcentage_2
test3=$(echo "$Date $p%" >> test.txt 
echo "$Date $p% est enregistrée")


yad --title="save" --info --text=" $test3 "





}


helps()
{
yad --info --text="Cette Application permet de 
1-Chercher touts les fichiers exécutables dont l'utilisateur mis en argument est propriétaire via l'option search 
2-Chercher touts les fichiers executables dont l'utilisateur mis en argument en supprimant l'exécutable via l'option search-rm
3-Chercher touts les fichiers executables dont l'utilisateur mis en argument en lisant en detail l'exécutable via l'option : search-ls
4-Calculer le nombre de touts les fichiers et le nombre de fichiers exécutables et calculer le pourcentage de ces derniers via l'option :per
5-Sauvegarder le pourcentage via l'option -s 

  Fin help"

}


program()
{
while true
do 
CHOIX=`menu`
case $? in
252|1) 
exit 0
;;
0)

	case $CHOIX in 
	"search|")
search


;;
	"search-rm|")
search_rm


;;
	"detail|")
detail 


;;
    "pourcentage|")
pourcentage

;;

"Save|")
save

;;

"help|")
helps
;;

"Quitter|")
exit
;;


esac
esac
done

}
#program


