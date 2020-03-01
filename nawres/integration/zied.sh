#! /bin/sh


menu()
{
yad --title=$TITBOX --text="veuillez entrer votre choix" \
     --window-icon="gnome" --image="gnome" --image-on-top \
    --list --radiolist --no-headers \
    --button=gtk-no:1 --button=gtk-yes:0 \
    --column 1 --column 2  --print-column=2 \
     true "search" true "search-rm" true "search-ls" \
     true "per" true "Sauvegarder" true "help"  true "Quitter"
}

search()
{
echo "Saisir le nom del'utilisateur"
read nomutilisateur
find / -user $nomutilisateur -executable -type f 2>&1 | grep -v "Permission non accordée"  2>&1 | grep -v "Aucun"
}
search_rm()
{
echo "Saisir le nom del'utilisateur"
read nomutilisateur
find  /home/razouane/test/ -user $nomutilisateur -executable -type f  -exec rm -f {} \;

}
search_ls()
{
s=$1

find -user $1 -executable -type f -ls 


}
per()
{
Date=$(date +%d-%m-%Y)
#rx=$(find -type f | wc -l)
#rt=$(find | wc -l)

#rx=$(find -executable  -type f | wc -l)
rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l )
p=$((100*$rx/$rt))
 
echo "$Date $p%" 

}
per_2()
{
Date=$(date +%d-%m-%Y)
#rx=$(find -type f | wc -l)
#rt=$(find | wc -l)

#rx=$(find -executable  -type f | wc -l)
rx=$(find -executable  -type f | wc -l)
rt=$(find -type f | wc -l )
p=$((100*$rx/$rt))
 

}
Sauvegarder()
{
per_2
echo "$Date $p%" >> test.txt 
echo "$Date $p% est enregistrée"


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
	"search-ls|")
search_ls $1



;;
    "per|")
per

;;

"Sauvegarder|")
sauvegarder

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
