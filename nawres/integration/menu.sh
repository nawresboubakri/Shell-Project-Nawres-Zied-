#!/bin/bash


menu_nawres()
{
dialog --clear  --help-button --backtitle "Linux Shell Script" \
--title "[ BIENVENUE DANS MENU - NAWRES -- ZIED ]" \
--menu "MERCI DE CHOISIR UNE TACHE" 15 50 4 \
Search "pour rechercher les fichers exe d'un certain user " \
Remove " Chercher touts les fichiers executables dont l'utilisateur mis en argument en supprimant l'exécutable via l'option search-rm " \
Detail "aficher en détail les fichers exe d'un certain user" \
Pourcentage "calculer le nombres de fichiers/fichiers exe et le pourcentage" \
Save "Sauvegarder le pourcentage " \
Quitter "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")



}


