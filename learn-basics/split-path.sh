#!/bin/bash
	
echo "
=== Split the current path '$PWD' into parts ===
";

PARTS=`tr '/' '\n' <<< $PWD;`

for PART in $PARTS; do
	echo $PART
done

echo "
=== Explanation ===

the 'for' loop can iterate over a string that contains spaces or newlines
so here it replaces slashes with newlines.

More info:
* https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html
"