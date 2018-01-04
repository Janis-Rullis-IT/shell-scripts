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

non_existing_script='i-totaly-do-not-exist.sh';

echo "Simple, boolean check to understand the structure:";

echo "";
echo "if true:";
if [[ true = true ]]; then
	echo '[[ true = true ]]';
fi

echo "";
echo "else if true != false:";
if [[ true != true ]]; then
	echo 'if [  true != true ]];';
elif [[ true != false ]]; then
	echo 'elif [[ true != false ]];';
fi

echo "";
echo "else:";
if [[ true != true ]]; then
	echo 'if [[  true != true ]];';
else
	echo 'else';
fi


echo "";
echo "File checks:
-d FILE	FILE exists and is a directory.
-e FILE	FILE exists.
-r FILE	FILE exists and the read permission is granted.
-s FILE	FILE exists and it's size is greater than zero (ie. it is not empty).
-w FILE	FILE exists and the write permission is granted.
-x FILE	FILE exists and the execute permission is granted.
";

echo "";
echo "Is this script readable?:";
if [[ -r $0 ]]; then
	echo 'if [[ -r $0 ]]';
fi

echo "";
echo "Is non-existing script '$non_existing_script' NOT readable?:";
if [[ ! -r $non_existing_script ]]; then
	echo "if [[ ! -r $non_existing_script ]];";
fi


echo "
More info:
* https://linuxacademy.com/blog/linux/conditions-in-bash-scripting-if-statements/
* https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
* https://stackoverflow.com/a/13618376
";