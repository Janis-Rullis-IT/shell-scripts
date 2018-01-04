#!/bin/bash

echo "
=== Convert a string into an array ===
"
	
items="
One 
Two 
Three";

echo "String = '$items'.
";

echo "First item = '${items[0]}'.
";

echo 'Convert to array by wrapping the $items in () like this items=($items)
';

items=($items);

echo "First item = '${items[0]}'.

More info:
* http://tldp.org/LDP/abs/html/arrays.html
"