#!/bin/bash

echo "
=== Prepend an arrow -> to each item in the list ===
"
	
PARTS="
One 
Two 
Three";

for PART in $PARTS; do
	echo '-> '$PART;
done

echo "
=== Explanation ===

the 'for' loop can iterate over a string that contains spaces or newlines.

More info:
* https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html
"