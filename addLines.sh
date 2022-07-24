#!/bin/sh

#title           :addLines.sh
#description     :This script add two repeated existed lines modifieds to a file.
#date			 :22/07/2022    
#usage		     :./addLines.sh
#bash_version    :4.4.23(1)-release
#==============================================================================

# Inputs [Example]
file="text.m"
pattern="'Certified' information"
search="Certified"
replace="CERTIFIED"

# Get line with a specific pattern
line=""
line="$(grep -n "${pattern}" "$file" | cut -d: -f1)"
numLineList=($line)

# Copy pattern line and the next at the end of this.
count=0
numLines2Add=2
for (( i=0; i<${#numLineList[@]}; i++ )); do
	numLine=$(( ${numLineList[$i]} + $count ))
	
	textLine1="$(awk -v var=$numLine 'NR>=var && NR<=var' "$file")"
	textLine1="$(sed "s+${search}+${replace}+g" <<< "$textLine1")"
	sed -i "$(( numLine + 1 )) a ${textLine1}" "$file"
	
	textLine2="$(awk -v var=$(( numLine + 1 )) 'NR>=var && NR<=var' "$file")"
	sed -i "$(( numLine + 2 )) a ${textLine2}" "$file"	
	
	count=$(( count + $numLines2Add ))
done
