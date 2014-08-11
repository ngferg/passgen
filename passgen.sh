#!/bin/bash
if [ "$1" = "-h" ]; then
	echo
	echo Password Generator help.
	echo Default usage: passgen
	echo generates 1 password
	echo ===========================
	echo passgen -h
	echo displays this help
	echo ===========================
	echo "passgen -m <num> [-n]"
	echo generate multiple passwords
	echo ===========================
	echo passgen -n
	echo no special characters
	echo ===========================
	echo
	exit
fi

let NUM=1;
if [ "$1" = "-m" ]; then
	if [[ -z $2 ]]; then
		exit
	fi
	let NUM=$2;
	echo How long would you like your passwords?: 
else
	echo How long would you like your password?: 
fi
read LEN
let RANGE=89;
let START=33;

for i in `seq 1 $NUM`;
do
	echo -n "Password $i: "
	for j in `seq 1 $LEN`;
	do
		let CHAR=$RANDOM;
		let "CHAR %= $RANGE";
		let "CHAR += $START";
		
		if [ "$1" = "-n" ] || [ "$3" = "-n" ]; then
			let CON=0;
			if [ $CHAR -lt 48 ] || [ $CHAR -gt 122 ]; then
				let CON=1;
			fi
			if [ $CHAR -gt 57 ] && [ $CHAR -lt 65 ]; then
				let CON=1;
			fi
			if [ $CHAR -gt 90 ] && [ $CHAR -lt 97 ]; then
				let CON=1;
			fi
			while [ $CON = 1 ]; do

				let CHAR=$RANDOM;
				let "CHAR %= $RANGE";
				let "CHAR += $START";
				let CON=0;
				if [ $CHAR -lt 48 ] || [ $CHAR -gt 122 ]; then
			        	let CON=1;
				fi
				if [ $CHAR -gt 57 ] && [ $CHAR -lt 65 ]; then
					let CON=1;
				fi
				if [ $CHAR -gt 90 ] && [ $CHAR -lt 97 ]; then
					let CON=1;
				fi
			done
		fi

		printf "\x$(printf %x $CHAR)"
	done
	echo
done
