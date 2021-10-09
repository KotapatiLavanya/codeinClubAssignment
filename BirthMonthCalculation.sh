n=50
declare -A birthday
for ((i=0; i<$n; i++))
do
	birthYear=$(shuf -i 92-93 -n $n)
	birthMonth=$((RANDOM%12+1))
	birthday[$birthMonth]=$((${birthday[$birthMonth]}+1))
done
for key in "${!birthday[@]}";
do
	echo "Month - $key No of individuals having birhtdays - ${birthday[$key]}"
done
