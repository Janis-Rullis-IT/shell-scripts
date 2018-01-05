#!/bin/bash

echo "
=== Loop through array using for loop ===
"

items[0]='One';
items[1]='Two';
items[2]='Three';

item_cnt=${#items[@]};

echo 'Foreach:';
for item in ${items[@]}; do
	echo $item;
done

echo '
For $i++:';
for ((i=0; i <= $item_cnt ; i++)); do
	echo ${items[$i]};
done

echo '
Inverse loop with For $i--:';
for ((i=$item_cnt-1; i >= 0 ; i--)); do
	echo ${items[$i]};
done

echo '
For with seq: https://en.wikipedia.org/wiki/Seq_(Unix)';
for i in $(seq 0 $item_cnt); do
	echo ${items[$i]};
done

echo "
More info:
* http://tldp.org/LDP/abs/html/arrays.html
* https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html 
* https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html
* http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-7.html

'seq' function:
* https://en.wikipedia.org/wiki/Seq_(Unix)
* https://www.cyberciti.biz/tips/how-to-generating-print-range-sequence-of-numbers.html
* http://man.cat-v.org/unix_8th/1/seq
";