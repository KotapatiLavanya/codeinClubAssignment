n=0
tossResult=0
tails=0
heads=0
for ((i=0; i<=$n+1; i++))
do
	((n++))
	tossResult=$((RANDOM%2))
	if [[ ${tossResult} -eq 0 ]]
	then
		((heads++))
	else
		((tails++))
	fi
	if [[ ${heads} -gt 21  ]]
	then
		diff=$((${heads}-${tails}))
		echo "Heads won by $diff times"
		break
	elif [[ ${tails} -gt 21  ]]
	then
		diff=$((${tails}-${heads}))
		echo "Tails won by $diff times"
		break
	elif [ ${heads} -eq 21 ] && [ ${tails} -eq 21 ]
	then
		echo "Tie"
		for ((i=0; i<=$n+1; i++))
		do
			((n++))
			tossResult=$((RANDOM%2))
			if [[ ${tossResult} -eq 0 ]]
			then
				((heads++))
			else
				((tails++))
			fi
				diff=$((${heads}-${tails}))
			if [[ ${diff} -eq 2  ]]
			then
				echo "After tie Heads won by $diff times"
				break
			elif [[ ${diff} -eq -2  ]]
			then
				echo "After tie Tails won by $((-$diff)) times"
				break
			fi
	
		done
		break
	fi
	
done
    