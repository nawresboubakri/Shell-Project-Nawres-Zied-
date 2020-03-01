INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$
vi_editor=${EDITOR-vi}
trap "rm $INPUT; exit" SIGHUP SIGINT SIGTERM

source menu.sh
source fonction.sh


while true
do
	
	menu 
case $menuitem in
	                1 )
					search $1;;
                        Search ) 
                                        search $1;;            
			
			2 )
					detail $1;;
                        Detail )
                                        detail $1;;
			
			3 )
					pourcentage;;
                        Pourcentage )   
                                        pourcentage;;	

			4 ) save;;
                        Save ) save;;

                        Quitter )
                                  echo "Bye"; break;;

			5 ) echo "Bye"; break;;
                          
esac		
			
			
		
  
done


