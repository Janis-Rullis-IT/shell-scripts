#!/bin/bash

echo "
=== Examples of  'if' conditions ===
";

echo 'Syntax: if CONDITIONS ; then
	...
else
	...
fi
';

echo "if true:";
if [ true = true ]; then
	echo '[ true = true ]';
fi

echo "";
echo "else if true != false:";
if [ true != true ]; then
	echo 'if [  true != true ];';
elif [[ true != false ]]; then
	echo 'elif [[ true != false ]];';
fi

echo "";
echo "else:";
if [ true != true ]; then
	echo 'if [  true != true ];';
else
	echo 'else';
fi

echo "";
echo "Is this script readable?:";
if [ -r $0 ]; then
	echo "if [ -r $0 ]";
fi

echo "
More info:
* https://linuxacademy.com/blog/linux/conditions-in-bash-scripting-if-statements/
* https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
";