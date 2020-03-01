INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$
vi_editor=${EDITOR-vi}
trap "rm $INPUT; exit" SIGHUP SIGINT SIGTERM

source menu.sh
source fonction.sh
source choix.sh
source zied.sh


while true
do

	menu_choix
case $choix in
          1 ) 
	                              menu_nawres 
                                     case $menuitem in
	               1 )
					search_zied $1;;
                       Search ) 
                                        search_zied $1;;     
                       2 )
                                     remove_zied $1;;
                       Remove ) 
                                     remove_zied $1;;
       
			
			3 )
					detail $1;;
                        Detail )
                                       detail $1;;
			
			4 )
					pourcentage;;
                        Pourcentage )   
                                       pourcentage;;	

		5 ) save;;
                        Save ) save;;

                        Quitter )
                                 echo "Bye"; break;;

			 6 ) echo "Bye"; break;;
                          
                                     esac	
             ;;
           2 )
               program $1;;
   # menu_yad ;;
	
        
esac
			
			
		
  
done


