echo "Welcome to Employee Wage Computation"
hourWage=20
fullTime=8
salary=0
totalSalary=0
partTime=4
hours=0
declare -A dailyWage
for ((i=0; i<20; i++))
do
empAttendence=$((RANDOM%3))
	case $empAttendence in
                 0)
			dailyWage[$i]=0
                 ;;
                 1)
			((hours+=${partTime}))
        		salary=$((partTime*hourWage))
		        ((totalSalary+=${salary}))
			dailyWage[$i]=$salary
                 ;;
                 2)
			((hours+=${fullTime}))
		        salary=$((fullTime*hourWage))
		        ((totalSalary+=${salary}))
			dailyWage[$i]=$salary
                 ;;
                 *)
                      echo "Something went wrong"
                 ;;
	esac
	if [[ ${hours} -ge 100 ]]
	then 
		break
	fi
done
echo "Daily Wage =" ${dailyWage[@]}
echo "Total Month Wage =" $totalSalary
echo "Total Working hours=" ${hours}
