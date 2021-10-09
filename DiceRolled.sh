declare -A diceResult
declare -A countResult
declare -A minvalue
n=0
minValue=1
minCount=0
for ((i=1; i<=6; i++))
do
	countResult[$i]=0
done
for ((i=0; i<=$n+1; i++))
do
	((n++))
	diceRolled=$((RANDOM%6+1))
	diceResult[$i]=${diceRolled}
	((countResult[${diceResult[$i]}]++))
	for ((j=1; j<=${#countResult[@]}; j++))
	do
		if [[ ${countResult[$j]} -eq 10 ]]
		then
			echo "Maximum rolled value is "$j
			for ((k=2; k<=${#countResult[@]}; k++))
			do
				if [[ ${countResult[$minValue]} -gt ${countResult[$k]} ]]
				then
					minValue=$k
					minCount=${countResult[$k]}
				else
					minCount=${countResult[$minValue]}
				fi
			done
			i=$n+1
		fi
	done
done
for ((i=1; i<=6; i++))
do
	if [[ ${countResult[$i]} -eq ${minCount} ]]
	then
		minvalue[$i]=$i
	fi
done
echo "Dice Result is "${diceResult[@]}
echo "Count Result is "${countResult[@]}
echo "Minimum Rolled numbers : ${minvalue[@]} for ${minCount} times"
