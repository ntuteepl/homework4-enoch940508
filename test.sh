echo "Running homework test..."
echo

num=0
parse_args() 
{
    case "$1" in
        -p)
            program="$2"
            ;;
        -n)
	    num="$2"
            ;;
        -s)
	    verifyCode="$2"
            ;;
        *)
            echo "Unknown or badly placed parameter '$1'." 1>&2
            exit 1
            ;;
    esac
}

while [[ "$#" -ge 2 ]]; do
    parse_args "$1" "$2" 
    shift; shift
done

shasum=`sha256sum "./ref/"$program"_ref" | awk '{print $1}'`
if [[ $shasum == $verifyCode ]]
then
	echo "The reference program $program is correct"
else
	
	echo "The reference program $program is corrupted"
	exit 1
fi

for (( i=1; i<=num; i++ ))
do 
	echo ${input[$i]}
 	chmod +x "./ref/"$program"_ref"
	hw_input=`bash input_generator.sh $program`
	hw_output=$(echo $hw_input | ./$program)
	expected_output=$(echo $hw_input | "./ref/"$program"_ref")

	if [ $? -eq 0 ] ; then
		echo "Pass: Program exited zero"
	else
		echo "Fail: Program did not exit zero"
		exit 1
	fi

	if echo "$hw_output" | tr '\n' ' ' | grep -q "$expected_output" ; then
		echo "Input: $hw_input"
		echo "Output: $hw_output"
		echo "Pass: Output is correct"
	else
		echo "Input: $hw_input"
        	echo "Expected '$expected_output' but got: $hw_output"
        	exit 1
	fi
done

echo
echo "Homework tests passed."

exit 0
