#!/bin/bash

echo "
=== Example of how arguments can be passed, processed, and replaced with default
values if not passed.

This is a simple example of arguments handled based on their sequence and 
not by parameter name like '-p' or '-u' ===";

first_param='default_value_for_the_1st';
second_param='default_value_for_the_2nd';

echo "";
echo 'This script $0 is called:';
echo $0;

echo "";
echo 'The first parameter $1: ';
if [[ -n $1 ]]; then
	echo $1;
	first_param=$1;
else
		echo "Hasn't been passed. Try './pass-arguments.sh hello'";
fi

echo "";
echo 'The second parameter $2: ';
if [[ -n $2 ]]; then
	echo $2;
	second_param=$2;
else
		echo "Hasn't been passed. Try './pass-arguments.sh hello there'";
fi

echo "";
echo "All passed parameters:";
echo $@;

echo "";
echo "Passed parameter count:";
echo $#;

echo "";
echo "First and the second parameter. Filled if not passed:";
echo $first_param $second_param;

echo "";