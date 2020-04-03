#!/bin/bash

# #3 See in https://github.com/Janis-Rullis-IT/shell-scripts/blob/cc5428f13dfb18fa23dae18213eeb6314cd14379/rig.sh#L45

echo "
=== Prepend an arrow -> to each item in the list ===
"
	
parts="
One 
Two 
Three";


echo "${parts[0]}";

for part in $parts; do
	echo '-> '$part;
done

echo "
=== Explanation ===

the 'for' loop can iterate over a string that contains spaces or newlines.

More info:
* https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html
* http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-7.html
"
