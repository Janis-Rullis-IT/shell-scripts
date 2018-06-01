#!/bin/bash
# Example of shell functions with arguments.
# https://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
# https://stackoverflow.com/a/6212408

echo "== Hi func ==
";

function hi ()
{
	text=$1
	name=$2

	echo "Hi ${text}${name}";
}

hi  'there, ' $1
