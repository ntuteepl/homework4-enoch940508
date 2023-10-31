#!/bin/bash

random_generator()
{
        num=$1
        minimum=$2
        maximum=$3

        #Check the taken values are valid
        if [ $maximum -lt $minimum ]; then
        echo "Maximum value can't be lower than minimum value"
        exit 1
        fi

        #Find out the difference between the numbers
        diff=$(($maximum-$minimum))

        #Check the difference value
        if [[ $diff == 1 ]]; then
                echo "The range of numbers must be more than 1"
                exit 1
        fi

        for (( i=1; i<=num; i++ ))
        do
                #Generate the random number
                randomNumber[$i]=$(($minimum + $RANDOM % $maximum))
        done
}

case "$1" in	
	hw4-1)
       		random_generator 1 1 50
		echo ${randomNumber[1]}
       		random_generator ${randomNumber[1]} 1 9999
		for i in ${randomNumber[@]}; do echo -n "$i "; done
		echo ""
      		;;
	hw4-2)
		data_array=(123 456 456 789 789 888 336 558 775 666 566 221)
	
       		random_generator 1 1 10
		n=${randomNumber[1]} 
		echo "$n"
		for i in $(seq 0 $((n-1)));
                do
       			random_generator 1 1 12
			index=${randomNumber[1]}
			if [ $index -le 6 ]
			then
				echo -n "${data_array[$(((index-1)*2))]} ${data_array[$(((index-1)*2+1))]} "
			else
				random_generator 2 1 999
				echo -n "${randomNumber[1]} ${randomNumber[2]} "
			fi
			echo ""
		done
      		;;
	hw4-3)
       		random_generator 1 1 10
		n=${randomNumber[1]} 

		for i in $(seq 0 $((n-1)));
                do
       			random_generator 2 1 24
			while [ ${randomNumber[2]} -le ${randomNumber[1]} ]
			do
				random_generator 2 1 24
			done
			echo -n "${randomNumber[1]} ${randomNumber[2]} "
		done
		echo ""
		#echo -e '\004'
      		;;
	hw4-4)
       		random_generator 1 2 9
		n=${randomNumber[1]} 
		total=$((n*n))
		echo "$n"

		number=($(seq 0 200))
		random_shuffle=($(shuf -e "${number[@]}"))
		for i in $(seq 0 $((total-1)));
                do
			echo -n "${random_shuffle[$i]} "
		done
		echo ""
      		;;
esac
