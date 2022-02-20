#!/bin/sh 

###################################################################
# Script Name : check_clients.sh
# 
# Description : file based client id check,
# can plugin database based client id check can be implemented too 
# 
#
# Args1 : filename to check (registered clients)
# Args1 : reqested certificate id to check       
#
# Return : if return (expected 11) is true client exists
# Creation Date : 27-07-2020
# Last Modified :
# 
# Created By :  
# Email : nbmaiti83@gmail.com                                           
###################################################################

#input="./ValidClients.txt"
input=$1 #filename ()

echo $2
idToChk=$2  #requested id to check

## following line to test/debug
##idToChk="XXXXXX-XXXXXX-XXXXXX-SFSM5QU-S5ZFSAK-ANICA3Q-XXXXXX-67S4EQC"

echo "In check_client.sh" 


if [ $input == "ValidClients.txt" ]
then

	while IFS= read -r line
	do
	 	if [ "$line" == "$idToChk" ] 
		then
			echo "current : $line"
			exit
		fi
	done < $input 
else
	echo "check in database" ## if passes then exit before exit 11
fi
exit 11
