echo "enter 3 values:"
read a
read b
read c
result1=$((a+b*c))
result2=$((a*b+c))
result3=$((c+a/b))
result4=$((a%b+c))
declare -A arr
arr[0]=$result1
arr[1]=$result2
arr[2]=$result3
arr[3]=$result4
echo "array ="${arr[@]}
echo "array length ="${#arr[@]}
  
echo "Array in original order"
echo ${arr[*]}
  
# Performing Bubble sort 
for ((i = 0; i<${#arr[@]}; i++))
do

    for((j = $i+1; j<${#arr[@]}; j++))
    do
      
        if [[ ${arr[$i]} -gt ${arr[$j]} ]]
        then
            # swap
            temp=${arr[$i]}
            arr[$i]=${arr[$j]}  
            arr[$j]=$temp
        fi
    done
done
  
echo "Array in sorted order :"
echo ${arr[*]}