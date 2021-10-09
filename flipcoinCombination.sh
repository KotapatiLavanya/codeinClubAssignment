echo "Enter No of times to be tossed:"
read n
tossResult=0
tossResult1=0
tossResult2=0
tails=0
heads=0
declare -A singlet
declare -A doublet
declare -A triplet
for ((i=0; i<$n; i++))
do
	tossResult=$((RANDOM%2))
	tossResult1=$((RANDOM%2))
	tossResult2=$((RANDOM%2))
	if [[ ${tossResult} -eq 0 ]]
	then
		singlet[$i]=H
	else
		singlet[$i]=T
	fi
	case ${tossResult}${tossResult1} in
	00)
		doublet[$i]=HH
	;;
	01)
		doublet[$i]=HT
	;; 
	10)
		doublet[$i]=TH
	;; 
	11)
		doublet[$i]=TT
	;; 
	*)
		echo "someting went wrong in doublet"
	;;
	esac 
	case ${tossResult}${tossResult1}${tossResult2} in
	000)
		triplet[$i]=HHH
	;;
	001)
		triplet[$i]=HHT
	;; 
	010)
		triplet[$i]=HTH
	;; 
	011)
		triplet[$i]=HTT
	;;
	100)
		triplet[$i]=THH
	;;
	101)
		triplet[$i]=THT
	;; 
	110)
		triplet[$i]=TTH
	;; 
	111)
		triplet[$i]=TTT
	;; 
	*)
		echo "someting went wrong in triplet"
	;;
	esac 
done
echo ${singlet[@]}
echo ${doublet[@]}
echo ${triplet[@]}
