#!/bin/bash
# Example of shell functions with arguments.
# Also check if directory is permanently changed in a function.
#
# https://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
# https://stackoverflow.com/a/6212408

echo "== Hi func ==
";

echo "Current directory: ${PWD}";

function hi ()
{
	text=$1
	name=$2

	echo "Hi ${text}${name}";
	echo "I'll move 1 directory up.";
	cd ..;
	echo "Current directory: ${PWD}"; 
	
}

hi  'there, ' $1
echo "After function current directory: ${PWD}
"; 

echo "== Conclusion: Functions affect permamently current directory. =="
