#!/bin/bash

echo "
=== Concatenate 2 variables and a static string. ===
"

name='John';
surname='Doe';
message="Hi! I'm $name $surname.";

echo $message;

echo "
=== Explanation ===

You can use variables inside a string only when the whole string is wrapped
in double quotes. If use single quotes then it looks like this 
'Hi! I'm '\$name' '\$surname';

"