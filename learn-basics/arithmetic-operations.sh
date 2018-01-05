#!/bin/bash

echo "
=== Example of arithmetic operations like +, -, * ===
"
echo 'Syntax: $((expression))
';

var1=3;
var2=2;

echo "var1 = $var1";
echo "var2 = $var2
";

echo 'Addition: $((var1 + var2)).'
echo "var1 + var2 =  $((var1 + var2)) .
";

echo 'Subtraction: $((var1 - var2)).'
echo "var1 - var2 =  $((var1 - var2)) .
";

echo 'Multiplication: $((var1 * var2)).'
echo "var1 * var2 =  $((var1 * var2)) .
";

echo 'Increment: ((var1++)).'
((var1++));
echo "var1++ => $var1 .
";

echo 'Decrement: ((var1--)).'
((var1--));
echo "var1-- => $var1 .
";

echo "More info:
* https://bash.cyberciti.biz/guide/Perform_arithmetic_operations 
* http://tldp.org/LDP/abs/html/ops.html
"