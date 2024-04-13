#!/bin/bash
helpFunction()
{
   echo "Usage: $0 -i <image>"
   echo -e "\t-i image path"
   exit 1 # Exit script after printing help
}

while getopts "i:" opt
do
   case "$opt" in
      i ) parameterI="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterI" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "Running: $parameterI"
vmLiveTyping/squeak $parameterI